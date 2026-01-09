# Package: xmenu

## Upstream
- Repository: https://github.com/phillbush/xmenu
- Language: C
- Version tracking: git tags (vX.Y.Z format)

## Update Detection
```bash
git ls-remote --tags --refs https://github.com/phillbush/xmenu.git | tail -1
```

## Update Instructions
1. Check upstream for new version tag
2. Update `pkgver` in PKGBUILD
3. Download new tarball and update `md5sums` with `updpkgsums`
4. Test build with `makepkg -sf`
5. Test install with `makepkg -si`
6. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
7. Commit with message: "xmenu: update to <version>"
