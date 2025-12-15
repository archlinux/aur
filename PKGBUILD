# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=qoder-gui-bin
pkgver=latest
pkgrel=1
pkgdesc="Qoder Agentic Coding App (GUI) - AI-powered code editor from Alibaba (Linux Beta, proprietary)"
url="https://qoder.com"
arch=('x86_64')
license=('proprietary')

# Runtime dependencies for Electron/VSCode-based applications
depends=(
  'gtk3'
  'libappindicator-gtk3'
  'libxss'
  'nss'
  'alsa-lib'
  'at-spi2-core'
  'libdrm'
  'mesa'
  'libcups'
  'libglib-2.0'
)

# bsdtar is part of base Arch system - no makedepends needed
options=('!strip')

_source_url="https://download.qoder.com/release/latest/qoder_x86_64.rpm"

prepare() {
  cd "${srcdir}"

  if [ ! -f "qoder_x86_64.rpm" ]; then
    echo "================================================================================"
    echo "Downloading latest Qoder GUI RPM from official source..."
    echo "URL: ${_source_url}"
    echo "================================================================================"
    curl -L -O "${_source_url}" || exit 1
  else
    echo "================================================================================"
    echo "Using existing qoder_x86_64.rpm from source directory"
    echo "================================================================================"
  fi

  echo "Extracting RPM package using bsdtar..."
  bsdtar -xf qoder_x86_64.rpm

  echo "================================================================================"
  echo "NOTE: Qoder does not provide official checksums."
  echo "      Verify the downloaded file manually if security is critical."
  echo "================================================================================"
}

package() {
  cd "${srcdir}"

  echo "================================================================================"
  echo "Installing Qoder GUI application files..."
  echo "================================================================================"

  # The actual application is under usr/share/qoder
  if [ -d "usr/share/qoder" ]; then
    mkdir -p "${pkgdir}/usr/share"
    cp -r usr/share/qoder "${pkgdir}/usr/share/"
    echo "Application files installed to /usr/share/qoder"
  else
    echo "ERROR: Expected directory usr/share/qoder not found!"
    exit 1
  fi

  # Install other standard directories if present
  [ -d "usr/bin" ] && cp -r usr/bin/* "${pkgdir}/usr/bin/" 2>/dev/null && echo "Bin symlinks installed"
  [ -d "usr/share/applications" ] && cp -r usr/share/applications/* "${pkgdir}/usr/share/applications/" 2>/dev/null && echo "Desktop entries installed"
  [ -d "usr/share/pixmaps" ] && cp -r usr/share/pixmaps/* "${pkgdir}/usr/share/pixmaps/" 2>/dev/null && echo "Pixmaps installed"
  [ -d "usr/share/appdata" ] && cp -r usr/share/appdata/* "${pkgdir}/usr/share/appdata/" 2>/dev/null && echo "AppData installed"

  # Create proper executable symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf /usr/share/qoder/bin/qoder "${pkgdir}/usr/bin/qoder-gui"
  echo "Executable symlink created: /usr/bin/qoder-gui → /usr/share/qoder/bin/qoder"

  # Optional: additional useful symlinks
  [ -f "${pkgdir}/usr/share/qoder/bin/qoder-tunnel" ] && \
    ln -sf /usr/share/qoder/bin/qoder-tunnel "${pkgdir}/usr/bin/qoder-tunnel" && \
    echo "qoder-tunnel symlink created"

  echo "================================================================================"
  echo "Qoder GUI successfully installed!"
  echo ""
  echo "Launch commands:"
  echo "  • qoder-gui               (main application)"
  echo "  • qoder-tunnel            (if available)"
  echo ""
  echo "Or find 'Qoder' in your application menu."
  echo "First launch: Sign in with your Qoder account to activate."
  echo "================================================================================"
}
