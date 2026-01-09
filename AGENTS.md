# Package: blender-mcp-git

## Upstream
- Repository: https://github.com/ahujasid/blender-mcp
- Type: Python package (VCS/git)
- Version tracking: git commits

## Update Detection
```bash
git ls-remote https://github.com/ahujasid/blender-mcp.git HEAD
```

## Update Instructions
1. pkgver auto-updates from git on build
2. Run `makepkg -sf` to rebuild
3. Test install with `makepkg -si`
4. Regenerate `.SRCINFO` (pkgver will change)
5. Commit: "blender-mcp-git: update to r<N>.<hash>"

## Notes
- Provides Blender addon at /usr/share/blender-mcp/addon.py
- Users must manually install addon in Blender preferences
