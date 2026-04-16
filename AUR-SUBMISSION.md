# mcp-linker-bin AUR submission notes

## Before publishing

1. Review the `Maintainer` line in `PKGBUILD` and adjust it if you prefer a different public contact format.
2. Re-run `makepkg --printsrcinfo > .SRCINFO` after any `PKGBUILD` change.
3. Build locally with `makepkg -s` on an Arch-based system.
4. Audit with `namcap PKGBUILD` and `namcap *.pkg.tar.zst`.
5. Optionally verify the upstream AppImage signature before publishing if you want to add a stronger trust workflow later.
6. For future upstream releases, bump `pkgver`, refresh checksums, regenerate `.SRCINFO`, and rebuild locally.

## Local validation commands

```bash
bash -n PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg -s
namcap PKGBUILD
namcap *.pkg.tar.zst
```

## Updating for a new upstream release

1. Change `pkgver` in `PKGBUILD`
2. Refresh checksums:

```bash
updpkgsums PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg -f --nodeps
```

## Later AUR publish flow

```bash
git remote add aur ssh://aur@aur.archlinux.org/mcp-linker-bin.git
git add .gitignore PKGBUILD .SRCINFO LICENSE mcp-linker-bin.desktop mcp-linker-bin.png mcp-linker-bin.sh AUR-SUBMISSION.md
git commit -m "Initial package release"
git push aur master
```

## Notes

- This package intentionally repackages the upstream x86_64 AppImage release.
- The package installs the AppImage under `/opt/mcp-linker-bin/` and provides a wrapper in `/usr/bin/mcp-linker-bin`.
- Desktop integration is provided by the packaged desktop file and icon.
- Do not commit downloaded sources, build directories, or built package archives; `.gitignore` excludes them.
