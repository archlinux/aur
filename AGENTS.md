# AGENTS.md — command-code AUR Package

AUR package for [Command Code](https://commandcode.ai), an AI coding agent distributed as a npm tarball. Maintainer: Ismet Togay <ismet.togay@gmail.com>. License: `LicenseRef-command-code` (proprietary).

Upstream version: **0.31.2** (pkgrel 1).

## Layout

Four tracked source files — nothing else:

| File | Role |
|------|------|
| `PKGBUILD` | Build script (60 lines) |
| `.SRCINFO` | AUR metadata; regenerate with `makepkg --printsrcinfo` |
| `LICENSE` | 0BSD for the PKGBUILD repo sources |
| `command-code.license` | Upstream Terms of Service; installed at `/usr/share/licenses/command-code/LICENSE` |

`opencode.json` and similar configs are not present — the repo is just a build recipe.

## What the package installs

Four wrapper scripts in `/usr/bin/` (`cmd`, `cmdc`, `command-code`, `commandcode`) that all `exec` `/usr/lib/node_modules/command-code/dist/index.mjs` with `COMMANDCODE_SKIP_UPDATES=1`. The npm tarball ships 4 symlinks pointing at the same entry; we delete them and install wrappers.

## Build & verify

```bash
rm -rf src pkg        # clean any prior build
makepkg -f            # build
sudo pacman -U command-code-0.31.0-*.pkg.tar.zst
cmd --version         # any of the 4 bin names works
ls /usr/share/licenses/command-code/LICENSE
```

## Version bump

1. `npm view command-code version` — get latest
2. Download new tarball; `curl -sL <url> | sha256sum`
3. Update `pkgver`, `pkgrel` (reset to 1), `sha256sums` in `PKGBUILD`
4. `makepkg --printsrcinfo > .SRCINFO`
5. `makepkg -f` to verify the build
6. Commit `PKGBUILD` + `.SRCINFO` only; push to `aur` remote (`master` tracks `aur/master`)

## Gotchas

These are the non-obvious bits. Don't remove them when refactoring the PKGBUILD.

**Why wrapper scripts intercept `update`.** `performAutoUpdate()` in the upstream code only checks `isLocalDevelopmentBuild()` — the `COMMANDCODE_SKIP_UPDATES` env var alone does **not** block it. The wrappers short-circuit at the shell level: any `update` subcommand prints a message and exits 0. Without this, the AUR install would self-upgrade out from under the package manager.

**`_where` cleanup.** npm embeds `$srcdir`/`$pkgdir` paths in the `_where` attribute of every `package.json` under the install tree. Remove them:

```bash
find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/\_where/d'
```

**jq regex for underscore-prefixed keys.** The Arch wiki's `\_.+` fails to compile on current jq. Use `^_`:

```bash
jq '.|=with_entries(select(.key|test("^_")|not))' "$pkgjson"
```

**`options=('!strip')`.** Without it, makepkg strips ELF binaries out of `sharp`'s native modules — slow and pointless for a JavaScript package.

**`noextract=("${pkgname}-${pkgver}.tgz")`.** npm handles extraction via `--prefix`; without `noextract`, makepkg extracts the tarball into `$srcdir` and npm re-extracts it again.

**`--allow-scripts sharp --allow-scripts protobufjs`.** Suppresses `npm warn allow-scripts` for the two packages that need install scripts (`sharp` downloads native binaries, `protobufjs` generates code). Using `--userconfig` is the older approach and was replaced in commit `9a2094a`.

**`command-code.license` must be in `source=`.** Otherwise it won't be copied to `$srcdir` and the `install -Dm644` line in `package()` fails. Use `SKIP` for its checksum.

## Working tree

Untracked files are build/runtime artifacts, **not** source:

- `command-code-0.31.0.tgz` — the downloaded npm tarball
- `command-code-*-x86_64.pkg.tar.zst` — built package
- `.commandcode/` — runtime data from using the tool (already ignored via the global `.*` rule)

`.gitignore` covers the first two. Never `git add` them; never commit the tarball alongside `PKGBUILD`.

## References

- [PKGBUILD(5)](https://man.archlinux.org/man/PKGBUILD.5)
- [Node.js package guidelines](https://wiki.archlinux.org/title/Node.js_package_guidelines)
- [Nonfree applications package guidelines](https://wiki.archlinux.org/title/Nonfree_applications_package_guidelines)
