# AGENTS.md — command-code AUR Package

## Project Overview

AUR package for [Command Code](https://commandcode.ai) — an AI coding agent that continuously learns your coding taste. Distributed via npm as UNLICENSED proprietary software.

- **Package name:** `command-code`
- **Upstream version:** 0.30.3
- **Maintainer:** Ismet Togay <ismet.togay@gmail.com>
- **License:** LicenseRef-command-code (proprietary Terms of Service)

## Repository Structure

```
command-code/
├── PKGBUILD                  # Package build script
├── .SRCINFO                  # AUR metadata (generated)
├── LICENSE                   # 0BSD license for PKGBUILD repo sources
├── command-code.license      # Upstream Terms of Service (installed as package license)
└── AGENTS.md                 # This file
```

## Package Metadata

| Field | Value | Notes |
|-------|-------|-------|
| `pkgname` | `command-code` | No `-bin` suffix — nonfree package guideline |
| `pkgver` | `0.30.1` | Sync with npm registry |
| `pkgrel` | `2` | Increment on PKGBUILD changes |
| `arch` | `x86_64` | sharp has platform-specific prebuilt binaries |
| `license` | `LicenseRef-command-code` | SPDX custom license reference |
| `depends` | `nodejs` | Runtime only |
| `makedepends` | `npm`, `jq` | Build only |
| `options` | `!strip` | JavaScript packages don't benefit from stripping |

## Binary Aliases

npm installs 4 symlinks in `/usr/bin/`:

| Binary | Target |
|--------|--------|
| `cmd` | `../lib/node_modules/command-code/dist/index.mjs` |
| `cmdc` | `../lib/node_modules/command-code/dist/index.mjs` |
| `command-code` | `../lib/node_modules/command-code/dist/index.mjs` |
| `commandcode` | `../lib/node_modules/command-code/dist/index.mjs` |

All point to `dist/index.mjs` (ES module entry point).

## Installation Paths

```
/usr/bin/cmd                                          → symlink
/usr/bin/cmdc                                         → symlink
/usr/bin/command-code                                 → symlink
/usr/bin/commandcode                                  → symlink
/usr/lib/node_modules/command-code/                   → package root
/usr/lib/node_modules/command-code/dist/index.mjs     → main entry
/usr/lib/node_modules/command-code/node_modules/      → dependencies
/usr/share/licenses/command-code/LICENSE              → Terms of Service
```

## Package Function Walkthrough

### 1. npm install

```bash
npm install -g \
    --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
```

- `--cache`: Prevents polluting `$HOME/.npm`
- `--prefix`: Installs into `${pkgdir}/usr` (creates `bin/`, `lib/node_modules/`)
- Tarball passed directly — npm handles extraction

### 2. Fix file ownership

```bash
chown -R root:root "${pkgdir}"
```

Safety measure. npm may set file ownership to build user instead of root. Bug FS#63396 was fixed in npm 9.8.0, but kept as precaution.

### 3. Clean `_where` references

```bash
find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/\_where/d'
```

npm embeds `$srcdir`/`$pkgdir` paths in `_where` attribute of all `package.json` files. This removes them.

### 4. Clean underscore-prefixed properties

```bash
jq '.|=with_entries(select(.key|test("^_")|not))' "$pkgjson" > "$tmppackage"
```

Removes `_id`, `_nodeVersion`, `_npmUser`, `_npmOperationalInternal`, `_hasShrinkwrap`, `_rev` from the main package.json.

### 5. Install license

```bash
install -Dm644 "${srcdir}/command-code.license" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
```

Installs the upstream Terms of Service as the package license.

## Source Files

| Source | Checksum | Notes |
|--------|----------|-------|
| `command-code-0.30.1.tgz` | `cee2ef52c8fe5d191af3576f7bb562fd3d58c5ca291686661c7e62957772f16` | npm registry tarball |
| `command-code.license` | `SKIP` | Local file, no need to verify |

## How to Update

1. Check npm for latest version: `npm view command-code version`
2. Update `pkgver` in PKGBUILD
3. Download new tarball and compute sha256: `curl -sL <url> | sha256sum`
4. Update `sha256sums` in PKGBUILD
5. Reset `pkgrel` to `1`
6. Regenerate `.SRCINFO`: `makepkg --printsrcinfo > .SRCINFO`
7. Test build: `makepkg -f`
8. Commit and push

## How to Test

```bash
# Clean build
rm -rf src pkg

# Build package
makepkg -f

# Install locally
sudo pacman -U command-code-0.30.1-*.pkg.tar.zst

# Verify binaries
cmd --version
command-code --version

# Verify license installed
ls /usr/share/licenses/command-code/LICENSE
```

## Design Decisions

| Decision | Rationale |
|----------|-----------|
| No `-bin` suffix | Nonfree software guideline: `-bin` implies source is available |
| `LicenseRef-command-code` | SPDX custom license for proprietary software |
| `options=(!strip)` | JavaScript packages don't benefit from ELF stripping; causes slow builds |
| No wrapper script | No documented `DISABLE_UPDATES` env var; wrapper would break npm symlinks |
| No `.install` file | No post-install messages needed; optdepends were removed |
| No `prepare()` function | npm `--cache` creates directories automatically |
| Pinned sha256sums | Reproducibility; `SKIP` only for local license file |
| `chown -R root:root` | Safety measure for file ownership in fakeroot context |
| `noextract` for tarball | npm handles extraction via `--prefix`; prevent makepkg double-extraction |

## Relevant Guidelines

- [Node.js package guidelines](https://wiki.archlinux.org/title/Node.js_package_guidelines)
- [Nonfree applications package guidelines](https://wiki.archlinux.org/title/Nonfree_applications_package_guidelines)
- [AUR submission guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
- [PKGBUILD(5)](https://man.archlinux.org/man/PKGBUILD.5)

## Dependencies

### Runtime

| Package | Purpose | Version Constraint |
|---------|---------|-------------------|
| `nodejs` | JavaScript runtime | Arch ships v26, compatible with sharp ^18.17.0 |

### Build

| Package | Purpose |
|---------|---------|
| `npm` | Package installer |
| `jq` | JSON manipulation for package.json cleanup |

### Notable Upstream Dependencies

| Package | Notes |
|---------|-------|
| `sharp` ^0.34.3 | Image processing; uses `@img/sharp-linux-x64` optional dep (prebuilt binary) |
| `react` ^19.1.7 | Terminal UI via ink |
| `ai` ^6.0.116 | Vercel AI SDK |

## Common Issues

### jq regex error

The Node.js guidelines show `"\_.+"` as the jq regex for underscore keys. This fails on current jq. Use `"^_"` instead:

```bash
# Wrong (jq compile error)
jq '.|=with_entries(select(.key|test("\_.+")|not))' "$pkgjson"

# Correct
jq '.|=with_entries(select(.key|test("^_")|not))' "$pkgjson"
```

### License file not found at install step

The `command-code.license` file must be in the `source` array to be copied to `$srcdir`. Add it with a `SKIP` checksum:

```bash
source=("$pkgname-$pkgver.tgz::https://..."
        "$pkgname.license")
sha256sums=('...'
            'SKIP')
```

### Strip step takes too long

Add `options=(!strip)` to PKGBUILD. Without it, makepkg strips ELF binaries from `sharp`'s native modules, which is slow and unnecessary for JavaScript packages.
