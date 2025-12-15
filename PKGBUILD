# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=qoder-gui-bin
pkgver=latest
pkgrel=1
pkgdesc="Qoder Agentic Coding App (GUI) - AI-powered code editor from Alibaba (Linux Beta, proprietary)"
url="https://qoder.com"
arch=('x86_64')
license=('proprietary')

# Optimized runtime dependencies for VS Code/Electron-based applications
# These are the most common ones required on clean Arch installs
depends=(
  'alsa-lib'
  'at-spi2-core'
  'dbus'
  'glib2'
  'gtk3'
  'libcups'
  'libdrm'
  'libxss'
  'mesa'
  'nss'
)

# No makedepends needed - bsdtar is always available on Arch
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
  echo "      For security-critical use, verify the downloaded file manually."
  echo "================================================================================"
}

package() {
  cd "${srcdir}"

  echo "================================================================================"
  echo "Installing Qoder GUI application..."
  echo "================================================================================"

  # Main application directory: /usr/share/qoder
  if [ -d "usr/share/qoder" ]; then
    mkdir -p "${pkgdir}/usr/share"
    cp -a usr/share/qoder "${pkgdir}/usr/share/"
    echo "Main application installed to /usr/share/qoder"
  else
    echo "ERROR: Required directory 'usr/share/qoder' not found in RPM!"
    exit 1
  fi

  # Standard directories from RPM
  for dir in bin applications pixmaps appdata; do
    if [ -d "usr/share/${dir}" ]; then
      mkdir -p "${pkgdir}/usr/share"
      cp -a usr/share/${dir} "${pkgdir}/usr/share/"
      echo "/usr/share/${dir} installed"
    fi
    if [ -d "usr/${dir}" ]; then
      mkdir -p "${pkgdir}/usr"
      cp -a usr/${dir}/* "${pkgdir}/usr/${dir}/" 2>/dev/null
      echo "/usr/${dir} content installed"
    fi
  done

  # Create reliable executable symlink
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf /usr/share/qoder/bin/qoder "${pkgdir}/usr/bin/qoder-gui"
  echo "Executable symlink created: qoder-gui → /usr/share/qoder/bin/qoder"

  # Optional: qoder-tunnel if exists
  if [ -f "${pkgdir}/usr/share/qoder/bin/qoder-tunnel" ]; then
    ln -sf /usr/share/qoder/bin/qoder-tunnel "${pkgdir}/usr/bin/qoder-tunnel"
    echo "qoder-tunnel symlink created"
  fi

  echo "================================================================================"
  echo "Qoder GUI installation completed successfully!"
  echo ""
  echo "How to launch:"
  echo "  • qoder-gui                 # Main application"
  echo "  • qoder-tunnel              # If available"
  echo "  • Or search 'Qoder' in your application menu"
  echo ""
  echo "First run: Sign in with your Qoder account (pakrohk@gmail.com)"
  echo "Enjoy agentic coding! 🚀"
  echo "================================================================================"
}
