# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=qoder-gui-bin
pkgver=latest
pkgrel=2
pkgdesc="Qoder Agentic Coding App (GUI) - AI-powered code editor from Alibaba (Linux Beta, proprietary)"
url="https://qoder.com"
arch=('x86_64')
license=('proprietary')

# Comprehensive runtime dependencies for VS Code/Electron-based applications on Arch
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libdrm'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'pango'
)

# bsdtar is built-in - no extra tools needed
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
  echo "Installing Qoder GUI files (standard /usr hierarchy from RPM)..."
  echo "================================================================================"

  # Copy the entire extracted 'usr/' directory hierarchy (preserves symlinks, permissions)
  if [ -d "usr" ]; then
    cp -a usr "${pkgdir}/"
    echo "Full /usr hierarchy installed from RPM"
  else
    echo "ERROR: No 'usr/' directory found after extraction!"
    exit 1
  fi

  # Ensure reliable executable symlink (overwrites if needed)
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf /usr/share/qoder/bin/qoder "${pkgdir}/usr/bin/qoder-gui"
  echo "Executable symlink created: qoder-gui → /usr/share/qoder/bin/qoder"

  # Optional tunnel tool symlink
  if [ -f "${pkgdir}/usr/share/qoder/bin/qoder-tunnel" ]; then
    ln -sf /usr/share/qoder/bin/qoder-tunnel "${pkgdir}/usr/bin/qoder-tunnel"
    echo "qoder-tunnel symlink created"
  fi

  echo "================================================================================"
  echo "Qoder GUI installation completed successfully!"
  echo ""
  echo "Launch commands:"
  echo "  • qoder-gui          # Main application"
  echo "  • qoder-tunnel       # If available"
  echo "  • Or search 'Qoder' in your application menu"
  echo ""
  echo "First run: Sign in with pakrohk@gmail.com"
  echo "Enjoy agentic coding! 🚀"
  echo "================================================================================"
}
