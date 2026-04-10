# Maintainer: tiesen243 <tiesen243@tiesen.id.vn>

pkgname=qianyu-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Qianyu desktop app"
arch=('x86_64')
url="https://github.com/tiesen243/qianyu"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/tiesen243/qianyu/releases/download/%40qianyu%2Fdesktop%40${pkgver}/qianyu-${pkgver}-ubuntu-latest.AppImage")
sha256sums_x86_64=('SKIP')

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"

  # Extract the AppImage
  "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install the extracted files
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/qianyu/qianyu.AppImage"

  # Create executable symlink mapping
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/qianyu/qianyu.AppImage" "${pkgdir}/usr/bin/qianyu"

  if [ -f "${srcdir}/squashfs-root/Qianyu.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/qianyu.png" "${pkgdir}/usr/share/pixmaps/qianyu.png"
  fi

  # Adjust desktop file to run the installed AppImage and put it in correct place
  if [ -f "${srcdir}/squashfs-root/Qianyu.desktop" ]; then
    install -Dm644 "${srcdir}/squashfs-root/Qianyu.desktop" "${pkgdir}/usr/share/applications/qianyu.desktop"
    sed -i "s|^Exec=.*|Exec=/usr/bin/qianyu --no-sandbox %U|" "${pkgdir}/usr/share/applications/qianyu.desktop"
    sed -i "s|^Icon=.*|Icon=qianyu|" "${pkgdir}/usr/share/applications/qianyu.desktop"
  fi
}
