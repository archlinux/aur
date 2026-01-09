# Package: openchamber

## Upstream
- Repository: https://github.com/btriapitsyn/openchamber
- NPM: https://www.npmjs.com/package/@openchamber/web
- Type: Node.js npm package
- Version tracking: npm registry

## Update Detection
```bash
npm view @openchamber/web version
```

## Update Instructions
1. Check npm for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -sf && makepkg -si`
5. Regenerate `.SRCINFO`
6. Commit: "openchamber: update to <version>"
