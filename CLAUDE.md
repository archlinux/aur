# CLAUDE.md

## Repository Overview

This is an Arch Linux AUR package for Inkdrop, a note-taking app with a robust Markdown editor. The package downloads the precompiled Linux binary distribution from Inkdrop's CDN and packages it with a desktop entry and icon for system integration.

## Inkdrop-Specific Files

- `checksum.sh`: Utility script to fetch MD5 checksums from Inkdrop's CDN headers for new releases
- `inkdrop.desktop`: Desktop entry file for application menu integration
- `inkdrop.png`: Application icon (1516 bytes)

## Package Maintenance

```bash
# Update checksums for new version (replace X.Y.Z with version)
./checksum.sh X.Y.Z

# Generate .SRCINFO after PKGBUILD changes
makepkg --printsrcinfo > .SRCINFO
```

### Version Discovery

New Inkdrop versions can be discovered using two methods:

1. **Official Announcements**: Check https://forum.inkdrop.app/c/announcements/14 for release announcements

2. **Sequential Testing**: Use `./checksum.sh` to test versions incrementally:
   - Start from current version and test patch versions (e.g., 5.11.0 → 5.11.1, 5.11.2, etc.)
   - When a patch version returns 404, try the next minor version (e.g., 5.11.3 → 404, try 5.12.0)
   - When a minor version returns 404, try the next major version (e.g., 5.12.0 → 404, try 6.0.0)
   - When a major version returns 404, the last successful version was the latest available
   
   Example flow:
   ```bash
   # Starting from 5.11.0
   ./checksum.sh 5.11.1  # Success → continue
   ./checksum.sh 5.11.2  # Success → continue  
   ./checksum.sh 5.11.3  # 404 → try next minor
   ./checksum.sh 5.12.0  # Success → continue with 5.12.1...
   # Or if 5.12.0 → 404, try 6.0.0
   # If 6.0.0 → 404, then 5.11.2 was the latest
   ```

## Architecture

This is a binary package that:
1. Downloads the precompiled Inkdrop Linux distribution (zip file) from `https://d3ip0rje8grhnl.cloudfront.net/vX.Y.Z/Inkdrop-X.Y.Z-Linux.zip`
2. Installs the application files to `/usr/lib/inkdrop/`
3. Creates a symlink at `/usr/bin/inkdrop` for command-line access
4. Installs desktop entry to `/usr/share/applications/` and icon to `/usr/share/pixmaps/`

The package supports only x86_64 architecture and depends on typical Electron app dependencies (gtk3, libsecret, gnome-keyring, etc.).
