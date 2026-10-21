# Packaging as an AUR package

Everything needed to publish this port as `xtool-studio` on the AUR, plus the
reasoning behind the packaging decisions. `PKGBUILD` and `.SRCINFO` in this
directory are already submission-ready.

---

## 1. What the package is

`xtool-studio` repackages the **official Windows installer** (downloaded by
`makepkg`, never committed) and runs it on the official Electron Linux runtime,
with the port patches from `build.sh` / the helper files in this directory.

Installed layout:

| Path | Content |
| --- | --- |
| `/usr/lib/xtool-studio/` | the whole application (Electron runtime + app + payload) |
| `/usr/bin/xtool-studio` | symlink to `.../xtool-studio-launcher` |
| `/usr/share/applications/xtool-studio.desktop` | desktop entry |
| `/usr/share/pixmaps/xtool-studio.png` | icon |
| `/usr/share/licenses/xtool-studio/` | bundled Electron/Chromium licenses |

---

## 2. Prerequisites

### Account and repository

1. Register at <https://aur.archlinux.org> and add an SSH public key
   (My Account → SSH Public Key). `xtool-studio` and `xtool-studio-bin` are both
   **free** (checked via the AUR RPC).
2. Name choice: AUR convention suggests a `-bin` suffix for repackaged binaries
   (`xtool-studio-bin`). This port also compiles a ~110-line bridge and patches
   the payload, so `xtool-studio` is defensible — if a reviewer insists on
   `-bin`, change `pkgname=` **and** keep the desktop/icon names at
   `xtool-studio` (they are referenced by `Exec=`/`Icon=`), i.e. install the
   `.desktop` as `xtool-studio.desktop` rather than `$pkgname.desktop`.

### Local tooling

```sh
sudo pacman -S --needed base-devel git namcap devtools shellcheck
```

* `base-devel` — `makepkg`, `fakeroot`, compilers
* `devtools` — clean-chroot builds (`pkgctl build`, `extra-x86_64-build`)
* `namcap` — lint the PKGBUILD and the built package
* `shellcheck` — `build.sh` and `algo-server-linux-x64` are shell scripts

Set `PACKAGER` in `/etc/makepkg.conf` (it is recorded in `.PKGINFO`).

The package itself needs, at build time: `7zip asar nodejs npm mingw-w64-gcc
python unzip curl imagemagick` (all declared in `makedepends`).

---

## 3. Repository contents

```
PKGBUILD
.SRCINFO
build.sh                  repack + patch driver
algo-ipc-bridge.c         AF_UNIX <-> named pipe bridge (compiled by build.sh)
algo-server-linux-x64     algo-server launcher shim
system-rs-index.js/.d.ts  pure-JS replacement for @atomm-studio/system-rs
worker-stdio-guard.js     EPIPE-tolerant worker stdio
xtool-studio.desktop
xtool-studio.install
README.md / AUR.md
.gitignore                keeps src/, pkg/, dist/, caches and the installer out of the repo
```

**The layout is flat on purpose.** `makepkg` resolves local `source=()` entries
by *basename* inside the PKGBUILD's directory (`get_filename`/`get_filepath` in
`/usr/share/makepkg/util/source.sh`), so `tools/foo.c` style entries are not
found. Keep new helper files at the top level and list them by name.

Do not commit: `src/`, `pkg/`, `dist/`, `work/`, `aurpkg/`, the 665 MB
installer, or downloaded archives (`electron-*.zip`, `*.tgz`, `*.pkg.tar*`).

---

## 4. Build and validate

```sh
makepkg --printsrcinfo > .SRCINFO   # after ANY PKGBUILD change
namcap PKGBUILD                     # must be silent
makepkg -f                          # normal build (zst)
namcap xtool-studio-*.pkg.tar.zst   # see section 7 for expected output
makepkg -si                         # install, then smoke test
```

Clean-chroot build (what `devtools` users and reviewers run):

```sh
pkgctl build            # or: extra-x86_64-build -- -I ~/.ssh/aur
```

It needs network access to download the installer, the Electron zip and the two
npm tarballs; nothing is downloaded inside `build()`.

Smoke test after install:

```sh
xtool-studio            # window "xTool Studio" appears
```

---

## 5. Publish

```sh
git clone ssh://aur@aur.archlinux.org/xtool-studio.git
cd xtool-studio
cp /path/to/repo/{PKGBUILD,.SRCINFO,build.sh,algo-ipc-bridge.c,algo-server-linux-x64,\
system-rs-index.js,system-rs-index.d.ts,worker-stdio-guard.js,\
xtool-studio.desktop,xtool-studio.install,README.md,AUR.md} .
git add -A
git commit -m "Initial import: xtool-studio 1.9.11-1"
git push
```

The first push creates the package. `.SRCINFO` must always match `PKGBUILD`;
regenerate and amend if you change anything after committing.

---

## 6. Upgrading to a new upstream release

```sh
./build.sh --check                     # prints the newest xTool-Studio-x64-*.exe URL
```

Then:

1. bump `pkgver` in `PKGBUILD` (the installer URL and filename are derived from
   it — update the storage UUID too, it changes every release);
2. update the installer's `sha256sums`; update the Electron zip sum **only if
   upstream bumped Electron** (`build.sh` auto-detects the runtime version from
   the payload, but `source=()` pins the zip);
3. `makepkg --printsrcinfo > .SRCINFO`;
4. commit with `upgpkg: xtool-studio <ver>-1`.

If the build aborts with *"kill-port pattern not found"*, upstream changed the
vendored helper: inspect `resources/app/.vite/build/app-*.js` for the new
`lsof … xargs kill -9` form and adjust the regex in `build.sh`.

---

## 7. Decisions a reviewer may question

| Topic | Choice | Rationale |
| --- | --- | --- |
| **Bundled Electron** | 36.2.0 in `/usr/lib/$pkgname` | Guarantees the exact runtime the payload was built against. Using AUR `electron36` (36.9.3) was **tested and works**, but the app's resources must then be overlaid onto `/usr/lib/electron36` with `bwrap` (the approach the `xtool-creative-space` AUR package uses), adding `electron36` + `bubblewrap` dependencies for ~250 MB less install size. |
| **`wine` is a hard dependency** | `depends=('wine')` | Toolpath generation is a closed-source Windows binary (`algo-server`, 9 plugin DLLs). Without it the app opens but cannot process a job. It is started transparently by `algo-server-linux-x64`. To install without it: `pacman -S --assume-installed wine …`. |
| **`chrome-sandbox` is setuid** | `chmod 4755`, `chown root:root` | Same as the `electron` and `chromium` packages. Verified: with it setuid the app runs without `--no-sandbox` and without the GPU/network-sandbox failures seen otherwise; the launcher falls back to `--no-sandbox` when the bit is absent. |
| **`!strip` / `!debug`** | enabled | The Electron binary, `.node` modules and `chrome-sandbox` must not be stripped. `namcap` therefore reports "unstripped ELF" — expected for `-bin`-style packages. |
| **`license=('custom')`** | proprietary | Upstream grants no redistribution-friendly license; the installer itself is fetched at build time. The Electron/Chromium license texts are installed under `/usr/share/licenses/$pkgname/`. The Windows payload contains no separate xTool EULA file to ship. |
| **Install size ≈ 1.3 GiB** | accepted | `exts.zip` 346 MB + Electron runtime ~250 MB + 9 algorithm plugin DLLs ~110 MB + app bundle. All of it is upstream content. |
| **Foreign prebuilds pruned** | only `linux-x64` glibc kept | The npm packages ship android/arm/ia32/musl builds; they are unusable here and made scanners report non-existent library dependencies. `build.sh` prunes them (and `node_modules/.bin`). |

Expected `namcap <package>` output after the current build: no `E:` lines, and
only the "unstripped ELF", "setuid", "lacks PIE/FULL RELRO" (prebuilt
binaries), "Dependency included, but may not be needed (`wine`)" and empty
leftover directories warnings. Nothing that requires action.

---

## 8. Verified packaging results

Run on Arch, 2026-10-22:

| Check | Result |
| --- | --- |
| `makepkg` | builds `xtool-studio-1.9.11-1-x86_64.pkg.tar.zst`; installed size ≈ 1.32 GiB |
| `namcap PKGBUILD` | silent |
| `namcap <package>` | **0 errors**; warnings only: unstripped ELF / lacks PIE / FULL RELRO (upstream prebuilt binaries), setuid `chrome-sandbox`, glibc's merged `libpthread`/`libdl`/`libm`, three empty leftover directories, and `wine` "may not be needed" (it is `exec`'d, not linked) |
| `pacman -U` | installs; `post_install` message prints; desktop MIME cache updates |
| Desktop entry | `desktop-file-validate` clean |
| Launch from `/usr/bin` | window appears, argv is only `--gtk-version=3` (SUID sandbox honoured), 0 GPU/network-sandbox failures, launch page loads |
| Layout | `/usr/bin/xtool-studio` → `/usr/lib/xtool-studio/xtool-studio-launcher`; `chrome-sandbox` is root-owned mode 4755 |

---

## 9. Known limitations worth documenting in the package

* USB connection needs a one-time NetworkManager change (the post-install
  message prints it): the machine's RNDIS gadget runs DHCP on
  `201.234.3.0/24`, but NetworkManager autocreates that link as link-local.
* No physical engraving was performed during verification; discovery, machine
  profile fetch and the algorithm worker were verified against a real xTool M1.
