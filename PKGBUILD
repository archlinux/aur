# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=qoder-gui-bin
pkgver=latest
pkgrel=1
pkgdesc="Qoder Agentic Coding App (GUI) - AI-powered code editor from Alibaba (Linux Beta, proprietary)"
arch=('x86_64')
url="https://qoder.com/download"
license=('proprietary')
# Runtime dependencies (common for Electron/Chromium-based apps - install if GUI crashes)
depends=('gtk3' 'libappindicator-gtk3' 'libxss' 'nss' 'alsa-lib' 'at-spi2-core')
# Build-time dependency: required for RPM extraction
makedepends=('rpm-tools')  # Provides rpm2cpio and cpio - makepkg will handle it automatically
options=('!strip')

_source_url="https://download.qoder.com/release/latest/qoder_x86_64.rpm"

prepare() {
  # Download latest RPM if not present
  if [ ! -f "${srcdir}/qoder_x86_64.rpm" ]; then
    echo "Downloading latest Qoder IDE RPM from official source..."
    curl -L -O "${_source_url}" || {
      echo "Download failed! Visit https://qoder.com/download and place the RPM manually."
      exit 1
    }
  fi

  echo "Extracting contents from RPM package..."
  rpm2cpio qoder_x86_64.rpm | cpio -idmv

  echo "Note: No official checksums provided by Qoder. Verify manually if security-critical."
}

package() {
  # Copy extracted files (typical structure: opt/qoder)
  if [ -d opt/qoder ]; then
    mkdir -p "${pkgdir}/opt"
    cp -r opt/qoder "${pkgdir}/opt/"
  elif [ -d usr ]; then
    cp -r usr/* "${pkgdir}/usr/"
  else
    echo "Warning: Unexpected RPM structure. Manual path adjustment may be required."
  fi

  # Symlink main executable
  find "${pkgdir}/opt/qoder" -type f -executable -name 'qoder*' -exec install -Dm755 {} "${pkgdir}/usr/bin/qoder-ide" \; 2>/dev/null

  # Install .desktop file if exists
  find . -name '*.desktop' -exec install -Dm644 {} "${pkgdir}/usr/share/applications/" \; 2>/dev/null

  # Copy icons if present
  find . -type d -name 'icons' -exec cp -r {} "${pkgdir}/usr/share/" \; 2>/dev/null

  echo "Qoder IDE installed successfully!"
  echo "Launch with 'qoder-ide' or from the application menu."
}
