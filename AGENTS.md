# Package: lazybeads-git

## Upstream
- Repository: https://github.com/codegangsta/lazybeads
- Language: Go
- Version tracking: git commits (no releases yet)

## Update Detection
Since this is a -git package, updates are continuous. Check for:
1. New commits on main branch
2. If releases start appearing, consider creating a stable `lazybeads` package

## Update Instructions
1. Run `makepkg -o` to fetch latest source and update pkgver
2. Test build with `makepkg -sf`
3. Test install with `makepkg -si`
4. Verify binary works: `lazybeads --help` or `lazybeads --version`
5. Commit with message: "lazybeads-git: update to r<count>.<hash>"

## Build Notes
- Requires Go 1.25+
- Runtime dependency on `beads` CLI (optional)
- Uses standard Go build flags for Arch packaging
