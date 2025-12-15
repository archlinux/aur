# Maintainer: pakrohk <pakrohk@gmail.com>
# Contributor: (optional - add if someone helps)
pkgname=qoder-gui-bin
pkgver=latest
pkgrel=1
pkgdesc="Qoder Agentic Coding App (GUI) - AI-powered code editor from Alibaba (Linux Beta, proprietary)"
url="https://qoder.com"
arch=('x86_64')
license=('proprietary')

# Runtime dependencies for typical Electron/Chromium-based GUI applications
# These cover most common missing library errors on fresh Arch installs
depends=(
  'gtk3'
  'libappindicator-gtk3'
  'libxss'
  'nss'
  'alsa-lib'
  'at-spi2-core'
  'libdrm'
  'mesa'
)

# No makepends required - bsdtar (libarchive) is part of the base system on Arch Linux
options=('!strip')

# Official direct download URL for the latest Linux RPM (x86_64)
_source_url="https://download.qoder.com/release/latest/qoder_x86_64.rpm"

prepare() {
  cd "${srcdir}"

  # Download the latest RPM if not already present in the source directory
  if [ ! -f "qoder_x86_64.rpm" ]; then
    echo "================================================================================"
    echo "Downloading latest Qoder GUI RPM from official source..."
    echo "URL: ${_source_url}"
    echo "================================================================================"
    curl -L -O "${_source_url}" || {
      echo "ERROR: Download failed. Check your internet connection or visit https://qoder.com/download"
      exit 1
    }
  else
    echo "================================================================================"
    echo "Using existing qoder_x86_64.rpm from source directory"
    echo "================================================================================"
  fi

  # Extract RPM contents using bsdtar (no external tools like rpm2cpio or cpio needed)
  echo "Extracting RPM package with bsdtar..."
  bsdtar -xf qoder_x86_64.rpm

  # Security notice - Qoder does not provide official checksums
  echo "================================================================================"
  echo "NOTE: Qoder does not publish official SHA256/MD5 checksums."
  echo "      For security-critical use, verify the downloaded file manually."
  echo "================================================================================"
}

package() {
  cd "${srcdir}"

  echo "Installing Qoder GUI files..."

  # Most RPMs extract to opt/qoder - copy everything there if present
  if [ -d "opt/qoder" ]; then
    mkdir -p "${pkgdir}/opt"
    cp -r opt/qoder "${pkgdir}/opt/"
    echo "Copied application files to /opt/qoder"
  elif [ -d "usr" ]; then
    # Fallback for unusual RPM layouts
    cp -r usr/* "${pkgdir}/usr/"
    echo "Copied files from usr/ hierarchy"
  else
    echo "WARNING: Unexpected RPM structure detected. Files may need manual adjustment."
  fi

  # Create symlink to main executable (common names: qoder, Qoder, AppRun, etc.)
  # The find command automatically picks the most likely executable
  find "${pkgdir}/opt/qoder" -type f -executable \( -name 'qoder' -o -name 'Qoder' -o -name 'AppRun' \) -exec \
    sh -c 'install -Dm755 "$1" "${pkgdir}/usr/bin/qoder-gui"' _ {} \; 2>/dev/null || \
    echo "WARNING: No obvious executable found. You may need to create a symlink manually."

  # Install .desktop file if present (for menu integration)
  find . -name '*.desktop' -exec install -Dm644 {} "${pkgdir}/usr/share/applications/" \; 2>/dev/null && \
    echo "Desktop entry installed"

  # Copy icons if a directory named 'icons' or similar exists
  find . -type d \( -name 'icons' -o -name 'hicolor' \) -exec cp -r {} "${pkgdir}/usr/share/" \; 2>/dev/null && \
    echo "Icons installed"

  echo "================================================================================"
  echo "Qoder GUI installation complete!"
  echo "Launch with: qoder-gui"
  echo "or from your application menu."
  echo "First run will prompt for sign-in with your Qoder account."
  echo "================================================================================"
}
