# Package: code-notify

## Upstream
- Repository: https://github.com/mylee04/code-notify
- Type: Shell scripts
- Version tracking: GitHub releases

## Update Detection
```bash
git ls-remote --tags --refs https://github.com/mylee04/code-notify.git | tail -1
```

## Update Instructions
1. Check GitHub releases for new version
2. Update `pkgver` in PKGBUILD
3. Run `updpkgsums`
4. Test with `makepkg -sf && makepkg -si`
5. Verify `cn --help`
6. Regenerate `.SRCINFO`
7. Commit: "code-notify: update to <version>"

## Notes
- Desktop notifications for AI coding tools (Claude Code, Codex, Gemini CLI)
- Replaces the old `claude-notify` AUR package (upstream rename in v1.3.0)
- Provides aliases: `cn` (quick access), `cnp` (project-specific)
- Depends on libnotify for notifications
- Optional: espeak-ng for voice announcements
