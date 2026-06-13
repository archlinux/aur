# AUR Release Guide (`magelab-bin`)

This repo includes `aur-release.sh` to automate building and publishing updates to the AUR package.

## What the script does

The script splits release work into two commands:

1. `prepare`
- Downloads the upstream `.deb`
- Updates `_magelab_deb_sha256` in `PKGBUILD`
- Builds `magelab-bin-<pkgver>-<pkgrel>-x86_64.pkg.tar.zst` from the `.deb`
- Prints the built file name and SHA256

2. `finalize`
- Updates `_magelab_zst_url` and `_magelab_zst_sha256` in `PKGBUILD`
- Regenerates `.SRCINFO`
- Optionally creates a git commit and pushes to AUR

## Prerequisites

Make sure these are installed:

- `base-devel` (for `makepkg`)
- `curl`
- `git`
- `sha256sum` (from `coreutils`)

The script must be run from this repo root (where `PKGBUILD` exists).

## Quick start (recommended)

If you want prompts for each step, you can run:

```bash
./aur-release.sh walkthrough
```

This mode:

- checks for a local `magelab_<version>_amd64.deb` before asking for a URL
- extracts version from the local file name or the upstream URL
- offers to update `pkgver`, then asks for `pkgrel`
- runs `prepare`
- pauses once the `.pkg.tar.zst` is built so you can add it to CrabNebula
- asks for the CrabNebula download URL for the `.pkg.tar.zst`
- runs `makepkg --printsrcinfo > .SRCINFO`
- asks before committing, then optionally asks before pushing to AUR

### 1. Prepare the build from upstream `.deb`

```bash
./aur-release.sh prepare
```

If upstream changed the `.deb` URL, pass it explicitly:

```bash
./aur-release.sh prepare --deb-url "https://cdn.example.com/path/magelab_0.9.1_amd64.deb"
```

If you also want to upload via CrabNebula CLI during `prepare`:

```bash
./aur-release.sh prepare \
  --deb-url "https://cdn.crabnebula.app/asset/01KGR9A1726QTT778WS206NJEB" \
  --upload \
  --upload-app "sapient-artifice/mage-lab" \
  --upload-platform "pacman-x86_64" \
  --upload-file "magelab-bin-0.9.1-1-x86_64.pkg.tar.zst" \
  --upload-signature "magelab-bin-0.9.1-1-x86_64.pkg.tar.zst.sig" \
  --upload-channel "beta"
```

Notes:

- `--upload-version` defaults to `pkgver` from `PKGBUILD`.
- If `--upload-file` is not set, it uploads the built pacman package.
- If `--upload-signature` is not set, the script auto-generates `<upload-file>.sig` using `gpg`.
- If `--upload-channel` is not set, the CrabNebula CLI uses the default release lookup.

After success, the script prints:

- the `.deb` URL used
- `.deb` SHA256 written to `PKGBUILD`
- built `.pkg.tar.zst` file name
- `.pkg.tar.zst` SHA256

### 2. Upload the built package to your CDN

Upload the file shown by `prepare`, for example:

```text
magelab-bin-0.9.1-1-x86_64.pkg.tar.zst
```

Copy the final public URL for that upload.

### 3. Finalize metadata and publish to AUR

```bash
./aur-release.sh finalize --zst-url "https://cdn.crabnebula.app/asset/NEW_ASSET_ID" --commit --push
```

What this does:

- updates `PKGBUILD` with hosted package URL + SHA256
- regenerates `.SRCINFO`
- commits `PKGBUILD` and `.SRCINFO`
- pushes to `origin` (your AUR remote)

## Command reference

```bash
./aur-release.sh prepare [--deb-url URL | --deb-file PATH] [--upload ...]
./aur-release.sh finalize --zst-url URL [--commit] [--push] [--message MSG]
./aur-release.sh walkthrough
```

Options:

- `--deb-url URL`: override `_magelab_deb_url` during `prepare`
- `--deb-file PATH`: build from a local `.deb` instead of downloading one
- `--upload`: run `cn release upload` during `prepare`
- `--upload-app X`: app slug (default `sapient-artifice/mage-lab`)
- `--upload-version X`: release version (default `pkgver` from `PKGBUILD`)
- `--upload-platform X`: value for `--public-platform` (default `pacman-x86_64`)
- `--upload-file X`: file path to upload (default built `.pkg.tar.zst`)
- `--upload-signature X`: optional signature path passed to `--signature` (auto-generated if omitted)
- `--upload-gpg-key X`: key ID/email for auto signature generation
- `--upload-channel X`: release channel (omit for the default release channel)
- `--zst-url URL`: required in `finalize`
- `--commit`: create a git commit for `PKGBUILD` + `.SRCINFO`
- `--push`: push to `origin` (implies `--commit`)
- `--message MSG`: custom commit message

## Typical version bump flow

1. Run `./aur-release.sh walkthrough`.
2. Let it reuse a local `.deb` or provide the upstream `.deb` URL.
3. Confirm the target `pkgver`/`pkgrel`, then build.
4. Upload the generated `.pkg.tar.zst` to CrabNebula and paste the download URL.
5. Let the script refresh `.SRCINFO`, commit when ready, then push when ready.

## Troubleshooting

`error: required command not found`
- Install missing tools (`base-devel`, `curl`, `git`, `coreutils`).

`expected output package not found`
- `prepare` build failed or `pkgver/pkgrel` changed after build.
- Re-run `./aur-release.sh prepare`.

`build artifact not found` during `finalize`
- Run `prepare` first, or ensure the built `.pkg.tar.zst` is still in repo root.

`git push` fails
- Confirm your AUR SSH key is configured and `origin` points to:
  - `ssh://aur@aur.archlinux.org/magelab-bin.git`

## Safety notes

- `prepare` removes local `src/` and `pkg/` build directories.
- Script edits `PKGBUILD` and `.SRCINFO`; review with:

```bash
git diff PKGBUILD .SRCINFO
```
