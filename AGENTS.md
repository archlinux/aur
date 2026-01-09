# Package: claude-code-ui

## Upstream
- Repository: https://github.com/siteboon/claudecodeui
- NPM: https://www.npmjs.com/package/@siteboon/claude-code-ui
- Type: Node.js npm package
- License: GPL-3.0
- Version tracking: npm registry

## Update Detection
```bash
npm view @siteboon/claude-code-ui version
```

## Update Instructions
1. Check npm for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -sf && makepkg -si`
5. Regenerate `.SRCINFO`
6. Commit: "claude-code-ui: update to <version>"
