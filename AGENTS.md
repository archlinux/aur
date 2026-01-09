# Package: arweave-deploy-bin

## Upstream
- Repository: https://github.com/ArweaveTeam/arweave-deploy
- Type: Pre-built binary
- Version tracking: git tags (vX.Y.Z format)

## Update Detection
```bash
git ls-remote --tags --refs https://github.com/ArweaveTeam/arweave-deploy.git | tail -1
```

## Update Instructions
1. Check upstream for new version tag
2. Update `pkgver` in PKGBUILD
3. Update `source` URL to point to new version's binary
4. Update `md5sums` with `updpkgsums`
5. Test build with `makepkg -sf`
6. Test install with `makepkg -si`
7. Verify binary works: `arweave --help`
8. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
9. Commit with message: "arweave-deploy-bin: update to <version>"

## Notes
- This is a -bin package - downloads pre-built binary, no compilation
- Binary URL pattern: `https://github.com/ArweaveTeam/arweave-deploy/raw/v<VERSION>/dist/linux/arweave`
