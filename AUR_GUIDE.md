# OpenOTP AUR Package Guide

This guide explains how to create, maintain, and submit an AUR package for OpenOTP.

## Prerequisites

### System Requirements
- Arch Linux or Arch-based distribution
- AUR helper (optional but recommended): `yay`, `paru`, etc.
- Git for AUR submission

### Required Dependencies
```bash
sudo pacman -S base-devel flutter cmake ninja pkgconf gtk3 git
```

## Installation Methods

### Method 1: Using an AUR Helper (Recommended)
```bash
# Using yay
yay -S openotp

# Using paru
paru -S openotp
```

### Method 2: Manual Installation
```bash
# Clone the AUR repository
git clone https://aur.archlinux.org/openotp.git
cd openotp

# Build and install
makepkg -si
```

### Method 3: Local Build (for testing)
```bash
# Use the files from this directory
cd aur-package
makepkg -si
```

## Submitting to AUR

### First-time Setup
1. Create an AUR account at https://aur.archlinux.org/
2. Upload your SSH public key to your AUR account
3. Configure Git:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

### Initial Submission
```bash
# Clone the empty AUR repository
git clone ssh://aur@aur.archlinux.org/openotp.git aur-openotp
cd aur-openotp

# Copy package files
cp ../aur-package/PKGBUILD .
cp ../aur-package/openotp.desktop .

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit and push
git add .
git commit -m "Initial import of OpenOTP v1.1.3"
git push
```

### Updating the Package
```bash
cd aur-openotp

# Update PKGBUILD with new version
# Update pkgver and pkgrel in PKGBUILD
# Update checksums if needed

# Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Test build
makepkg -f

# Commit and push
git add .
git commit -m "Update to v1.1.4"
git push
```

## Package Maintenance

### Updating Checksums
```bash
# Download source and calculate checksum
wget https://github.com/Slipstreamm/OpenOTP/archive/v1.1.3.tar.gz
sha256sum v1.1.3.tar.gz

# Update the sha256sums array in PKGBUILD
```

### Testing the Package
```bash
# Clean build
makepkg -f

# Install and test
sudo pacman -U openotp-*.pkg.tar.zst

# Test the application
openotp
```

### Common Issues and Solutions

#### Flutter Build Issues
- Ensure Flutter is properly installed: `flutter doctor`
- Clear Flutter cache: `flutter clean`
- Update Flutter: `flutter upgrade`

#### Missing Dependencies
- Install all makedepends: `sudo pacman -S flutter cmake ninja pkgconf`
- Install runtime depends: `sudo pacman -S gtk3 libsecret`

#### Permission Issues
- Ensure proper SSH key setup for AUR
- Check Git configuration

## Package Structure

```
openotp/
├── PKGBUILD          # Main build script
├── .SRCINFO          # Package metadata (auto-generated)
├── openotp.desktop   # Desktop entry file
└── .git/             # Git repository
```

## Best Practices

1. **Version Updates**: Always update both `pkgver` and reset `pkgrel=1`
2. **Checksums**: Use actual checksums, not 'SKIP' in production
3. **Testing**: Always test build locally before pushing
4. **Dependencies**: Keep dependencies minimal and accurate
5. **Commit Messages**: Use descriptive commit messages

## Troubleshooting

### Build Failures
```bash
# Check Flutter installation
flutter doctor

# Clean previous builds
rm -rf src/ pkg/
makepkg -f

# Check dependencies
pacman -Q flutter cmake ninja pkgconf gtk3
```

### AUR Submission Issues
```bash
# Check SSH connection
ssh -T aur@aur.archlinux.org

# Verify .SRCINFO is up to date
makepkg --printsrcinfo > .SRCINFO
git diff .SRCINFO
```

## Helper Scripts

### Update Checksums Script
Create `update-checksums.sh`:
```bash
#!/bin/bash
VERSION="1.1.3"
wget -O "openotp-${VERSION}.tar.gz" "https://github.com/Slipstreamm/OpenOTP/archive/v${VERSION}.tar.gz"
CHECKSUM=$(sha256sum "openotp-${VERSION}.tar.gz" | cut -d' ' -f1)
echo "Source checksum: $CHECKSUM"
DESKTOP_CHECKSUM=$(sha256sum openotp.desktop | cut -d' ' -f1)
echo "Desktop file checksum: $DESKTOP_CHECKSUM"
rm "openotp-${VERSION}.tar.gz"
```

## Resources

- [AUR Submission Guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
- [PKGBUILD Manual](https://man.archlinux.org/man/PKGBUILD.5)
- [Flutter Linux Desktop](https://docs.flutter.dev/platform-integration/linux/building)
- [OpenOTP GitHub](https://github.com/Slipstreamm/OpenOTP)
