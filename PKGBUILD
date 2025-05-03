# Maintainer: Wei Hao <dolem.hao@gmail.com>
pkgname=landrop-bin
_pkgname=landrop
pkgver=2.7.2
pkgrel=2
pkgdesc="Drop any files to any devices on your LAN"
arch=('x86_64' 'aarch64')
url="https://landrop.app/"
license=('custom')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3: for system tray icon support'
)
provides=('landrop')
conflicts=('landrop' 'landrop-git')
install="${pkgname}.install"
source_x86_64=("https://releases.landrop.app/landrop-v2-electron/LANDrop-${pkgver}-linux-amd64.deb")
source_aarch64=("https://releases.landrop.app/landrop-v2-electron/LANDrop-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('2073c1472275811ca36bf29fa3ff319b1a11804cb674b029edca56a1e9d75703')
sha256sums_aarch64=('0dc5b3ae386567c861bff5b50451a16e81fa1d22fe24021780491f65d8c9bb3f')

prepare() {
  if [ "$CARCH" = "x86_64" ]; then
    _debarch="amd64"
  else
    _debarch="arm64"
  fi
  
  # Extract the deb package
  bsdtar -xf "${srcdir}/LANDrop-${pkgver}-linux-${_debarch}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
}

package() {
  # Copy application files
  cp -r "${srcdir}/usr" "${pkgdir}/"
  
  # Copy opt directory (contains the actual application)
  mkdir -p "${pkgdir}/opt"
  cp -r "${srcdir}/opt/LANDrop" "${pkgdir}/opt/"
  
  # Fix permissions
  chmod 755 "${pkgdir}/opt/LANDrop/landrop-v2-electron"
  chmod 4755 "${pkgdir}/opt/LANDrop/chrome-sandbox"
  
  # Create symlink for the binary
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/LANDrop/landrop-v2-electron" "${pkgdir}/usr/bin/landrop"
  
  # Replace the original desktop file with our modified version
  sed -i 's|Exec=/opt/LANDrop/landrop-v2-electron|Exec=landrop|g' \
    "${srcdir}/usr/share/applications/landrop-v2-electron.desktop"
  sed -i 's|Icon=landrop-v2-electron|Icon=landrop|g' \
    "${srcdir}/usr/share/applications/landrop-v2-electron.desktop"
  install -Dm644 "${srcdir}/usr/share/applications/landrop-v2-electron.desktop" \
    "${pkgdir}/usr/share/applications/landrop.desktop"
  
  # Make sure we don't install the original desktop file
  rm -f "${pkgdir}/usr/share/applications/landrop-v2-electron.desktop"
  
  # Create symlink for the icon
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
  cp "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/landrop-v2-electron.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/landrop.png"
  
  # Install license files
  install -Dm644 "${srcdir}/opt/LANDrop/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}