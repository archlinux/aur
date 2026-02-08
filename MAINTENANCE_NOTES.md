# luban-bin Maintenance Notes

## Incident: 2026-02-09 Auto-update + Runtime Validation

### What went wrong

1. The generic auto-update flow assumed split-arch `.deb` assets, but upstream `Xuanwo/luban` publishes Linux artifacts as `AppImage` only.
2. The package was pushed to AUR before local runtime validation.
3. On Wayland setups, running the AppImage could fail with:
   `Could not create default EGL display: EGL_BAD_PARAMETER. Aborting...`

### Root causes

1. Upstream release format mismatch (`AppImage` vs `.deb`).
2. Process order issue (publish happened before smoke/runtime checks).
3. Known Tauri/WebKitGTK/AppImage compatibility issue on some Wayland environments.

### Fixes applied in this repo

1. Updated package to `0.2.21` and synchronized all source/hash/filename references.
2. Added a launcher workaround in `PKGBUILD` output script (`/usr/bin/luban`):
   - On Wayland, preload system Wayland client library when available:
   - `LD_PRELOAD=/usr/lib/libwayland-client.so` (or `.so.0`)
3. Bumped `pkgrel` for the packaging fix (`0.2.21-2`).

### Working update workflow (must follow)

1. Update metadata:
   - `pkgver`, source URL, checksums, and any filename suffix references.
2. Regenerate and verify:
   - `makepkg --printsrcinfo > .SRCINFO`
   - `makepkg --verifysource`
3. Build locally:
   - `makepkg -f`
4. Install and run locally (requires sudo password from user):
   - `sudo pacman -U ./luban-bin-<version>-x86_64.pkg.tar.zst`
   - `luban`
5. Validate visible runtime behavior:
   - Use `niri` window inspection and screenshot capture to confirm window renders correctly.
6. Only after local validation passes:
   - commit with conventional commits
   - push to AUR remote

### Operator rule

- Run, validate, and screenshot autonomously.
- Ask the user only when root password input is needed for installation.

### References

- https://github.com/tauri-apps/tauri/issues/11994
- https://github.com/jely2002/youtube-dl-gui/issues/603
- https://github.com/gitbutlerapp/gitbutler/issues/5282#issuecomment-3598600651
- https://support.nym.com/hc/en-us/articles/36399033389713-Common-Linux-Issues-Speed-Blank-Screen-with-AppImage
