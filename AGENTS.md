# Package: claude-notify

## Upstream
- Repository: https://github.com/mylee04/claude-notify
- Type: Shell scripts
- Version tracking: GitHub releases

## Update Detection
```bash
git ls-remote --tags --refs https://github.com/mylee04/claude-notify.git | tail -1
```

## Update Instructions
1. Check GitHub releases for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -sf && makepkg -si`
5. Verify `claude-notify --version`
6. Regenerate `.SRCINFO`
7. Commit: "claude-notify: update to <version>"

## Notes
- Installs to /usr/share/claude-notify/lib/
- Creates symlinks: claude-notify, cn, cnp
- Depends on libnotify (notify-send)
