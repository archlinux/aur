# Package: yacy

## Upstream
- Repository: https://github.com/yacy/yacy_search_server
- Website: https://yacy.net
- Downloads: https://download.yacy.net/
- Type: Java application (requires Java 11+)
- Version tracking: GitHub tags (Release_X.XXX)

## Update Detection
nvchecker tracks GitHub tags with prefix `Release_`.

## Update Instructions

### 1. Find the new tarball filename
The download URL includes a build date and commit hash that must be discovered:

```bash
NEW_VER="1.940"  # from nvchecker
TARBALL=$(curl -s "https://download.yacy.net/" | grep -oE "yacy_v${NEW_VER}_[^\"]+\.tar\.gz" | grep -v 'java_8' | head -1)
echo "Tarball: $TARBALL"
# Extract _pkgextraver (everything between version and .tar.gz)
EXTRAVER=$(echo "$TARBALL" | sed -E "s/yacy_v${NEW_VER}_(.*)\.tar\.gz/\1/")
echo "_pkgextraver=$EXTRAVER"
```

### 2. Update PKGBUILD
- Update `pkgver` to new version
- Update `_pkgextraver` to discovered value
- Reset `pkgrel` to 1

### 3. Build and test
```bash
updpkgsums
makepkg -sf
makepkg -si  # test install
systemctl start yacy
curl -s http://localhost:8090 | grep -q YaCy && echo "OK"
systemctl stop yacy
```

### 4. Generate .SRCINFO
```bash
makepkg --printsrcinfo > .SRCINFO
```

## Notes
- YaCy stores data in `/var/lib/yacy` (symlinked from `/usr/share/yacy/DATA`)
- Web interface runs on port 8090 by default
- Requires Java 11+ (changed from Java 8 in version 1.930)
- Uses pre-built tarball (no build step needed)
