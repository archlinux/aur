# Package: bdui-bin

## Upstream
- Repository: https://github.com/assimelha/bdui
- Type: Pre-built Bun binary
- Version tracking: GitHub releases

## Update Detection
```bash
git ls-remote --tags --refs https://github.com/assimelha/bdui.git | tail -1
```

## Update Instructions
1. Check GitHub releases for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -si`
5. Regenerate `.SRCINFO`
6. Commit: "bdui-bin: update to <version>"
