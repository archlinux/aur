# Warp Packaging Notes

## Current Software Status

- Validation date: 2026-02-09
- Upstream stable package observed from Warp redirect:
  - Version: `v0.2026.02.04.08.20.stable_03`
  - File: `warp-terminal-v0.2026.02.04.08.20.stable_03-1-x86_64.pkg.tar.zst`
- Local packaging result:
  - Package name: `warp-terminal-autoup-bin`
  - Install test status: successful (`pacman -U` completed and `warp-terminal --help` worked)

## How To Download The Latest Pacman Package

Warp exposes a moving redirect endpoint:

- `https://app.warp.dev/download?package=pacman`

Use the redirect to resolve the current versioned file URL, then download:

```bash
latest_url="$(
  curl -fsSI 'https://app.warp.dev/download?package=pacman' \
    | awk -F': ' 'tolower($1)=="location"{gsub("\r","",$2); print $2; exit}'
)"
echo "$latest_url"
curl -fL -O "$latest_url"
```

Optional checksum:

```bash
sha256sum "$(basename "$latest_url")"
```

## Key Differences

### 1) Moving URL vs Versioned URL

- Moving URL (`app.warp.dev/download?...`)
  - Always points to the latest stable package.
  - Good for discovery.
  - Not checksum-stable over time.
- Versioned URL (`releases.warp.dev/stable/v.../...pkg.tar.zst`)
  - Immutable artifact for one release.
  - Good for `PKGBUILD` `source` + checksum pinning.

### 2) Upstream Package vs This AUR Repackage

- Upstream package (`warp-terminal-...pkg.tar.zst`)
  - Already installable directly via `pacman -U`.
  - Contains its own `.PKGINFO` metadata.
- This repo package (`warp-terminal-autoup-bin`)
  - Repackages upstream files through `makepkg`.
  - Drops upstream metadata files (`.PKGINFO`, `.BUILDINFO`, `.MTREE`) during `package()`.
  - Metadata is defined by this repo's `PKGBUILD`/`.SRCINFO`.

### 3) Dependency Handling

- Repackaging does **not** automatically inherit upstream `depends`.
- Dependency declarations must be maintained explicitly in `PKGBUILD` and synced to `.SRCINFO`.
