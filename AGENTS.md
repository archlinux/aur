# Package: ccstatusline

## Upstream
- Repository: https://github.com/sirmalloc/ccstatusline
- NPM: https://www.npmjs.com/package/ccstatusline
- Type: Node.js npm package
- Version tracking: npm registry

## Update Detection
```bash
npm view ccstatusline version
```

## Update Instructions
1. Check npm for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -sf && makepkg -si`
5. Regenerate `.SRCINFO`
6. Commit: "ccstatusline: update to <version>"
