# flclash-oixcloud

AUR package repackaging the **dler.io custom FlClash build** (`https://dl.dler.io/flclash-linux-amd64.deb`).

## Rules

- Never check GitHub releases (chen08209/FlClash) for updates — the deb's version does not follow GitHub tags.
- `pkgver` is the deb's `Version:` field (`control.tar.*/control`) copied verbatim: `<flclash-version>+<buildstamp>`, e.g. `0.8.99+2026092815`.
- `url` in PKGBUILD intentionally points at the maintainer's site (https://oixcloud.com), not upstream.

## Update procedure

1. `curl -sI` the deb URL — if `last-modified` is not newer than the build stamp in the current `pkgver`, stop.
2. Download the deb, `bsdtar -xf` it, read `Version:` from `control.tar.*/control`.
3. Audit `depends` in both directions — see "Dependency audit" below.
4. Bump `pkgver` and replace the deb's sha256sum (the second sum) in PKGBUILD.
5. `makepkg --printsrcinfo > .SRCINFO`
6. `makepkg -sf` to verify; keep the built `*.pkg.tar.zst` — the installer is usually wanted next.
7. Commit only `PKGBUILD` and `.SRCINFO`, message `Update to <pkgver>`.

## Deb layout assumptions

`prepare()` / `package()` require in `data.tar`:

- `usr/share/applications/FlClash.desktop`
- `usr/share/icons/hicolor/128x128/apps/FlClash.png` and `256x256` (only these sizes)
- payload under `usr/share/FlClash/` (binary + `lib/`)

Verify with `bsdtar -tf data.tar.*` on every update — if paths moved, the PKGBUILD functions need real changes, not just a version bump. If the deb's `Depends:` changed, that is a prompt to look harder at the dependency audit, but run the audit on every update regardless.

## Dependency audit (every update)

Collect the external `NEEDED` sonames of every ELF shipped in the deb:

    cd usr/share/FlClash
    for f in FlClash FlClashCore FlClashHelperService lib/*.so; do
        readelf -d "$f" | awk '/NEEDED/{print $5}'
    done | tr -d '[]' | sort -u

Then check both directions:

- **Missing deps:** every external soname must be provided by an entry in `depends` or by a package that `depends` already pulls in — verify with `pacman -Si`, not assumption. Do not rely on makepkg soname auto-deps (this pacman adds none to the built package) or on transitive coverage: Arch's `libayatana-appindicator` does *not* depend on `libayatana-indicator`, yet `libtray_plugin.so` needs `libayatana-indicator3.so.7`.
- **Redundant deps:** every `depends` entry must map to a `NEEDED` soname or another concrete requirement; drop the rest. Precedents: `libkeybinder3` dropped in 0.9.1+2026102409 (zero references in any ELF), `quickjs-c-bridge-git` dropped same version (QuickJS statically linked into `librust_api.so` via rquickjs; the plugin `.so` is gone from the deb).

The deb's own `Depends:` field is a weak Debian-name signal only; the ELF audit is authoritative. Bundled `libdartjni.so` needing `libjvm.so` is an Android leftover nothing loads — ignore it, it is not a dependency.
