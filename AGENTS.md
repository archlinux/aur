# Package: promptfoo

## Upstream
- Repository: https://github.com/promptfoo/promptfoo
- NPM Package: https://www.npmjs.com/package/promptfoo
- Type: Node.js package
- Version tracking: npm releases

## Update Detection
```bash
npm view promptfoo version
```

or check GitHub releases:
```bash
git ls-remote --tags --refs https://github.com/promptfoo/promptfoo.git | grep -v 'promptfoo-v' | tail -1
```

## Update Instructions
1. Check npm for new version: `npm view promptfoo version`
2. Update `pkgver` in PKGBUILD
3. Update checksums with `updpkgsums`
4. Test build with `makepkg -sf`
5. Test install with `makepkg -si`
6. Verify binary works: `promptfoo --version`
7. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
8. Commit with message: "promptfoo: update to <version>"

## Notes
- Node.js package installed via npm
- Provides both `promptfoo` and `pf` binaries
- Used for LLM testing, AI red teaming, and vulnerability scanning
