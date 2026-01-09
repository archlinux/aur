# Package: fractalart-git

## Upstream
- Repository: https://github.com/TomSmeets/FractalArt
- Language: Haskell
- Version tracking: git commits (no stable releases)

## Update Detection
```bash
git ls-remote https://github.com/TomSmeets/FractalArt.git HEAD
```

## Update Instructions
1. Fetch latest source with `makepkg -o` (requires ghc, cabal-install)
2. Note the new pkgver from output
3. Update `pkgver` in PKGBUILD manually if needed
4. Test build with `makepkg -sf`
5. Test install with `makepkg -si`
6. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
7. Commit with message: "fractalart-git: update to r<count>.<hash>"

## Build Notes
- Requires Haskell toolchain (ghc, cabal-install)
- Uses cabal for dependency management
- Installs to /etc/xdg/autostart for desktop wallpaper generation
