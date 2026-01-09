# Package: kimaki

## Upstream
- Repository: https://github.com/remorses/kimaki
- NPM: https://www.npmjs.com/package/kimaki
- Type: Node.js npm package (Discord bot)
- Version tracking: npm registry

## Update Detection
```bash
npm view kimaki version
```

## Update Instructions
1. Check npm for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -sf && makepkg -si`
5. Regenerate `.SRCINFO`
6. Commit: "kimaki: update to <version>"

## Notes
- Requires Node.js 22+ for @discordjs/voice (warning expected on older Node)
