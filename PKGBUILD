# Maintainer: tiesen243 <tiesen243@tiesen.id.vn>

pkgname=qianyu-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Description of Qianyu"
arch=('x86_64')
url="https://github.com/tiesen243/qianyu"
license=('MIT') # Replace with actual license
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/tiesen243/qianyu/releases/download/%40qianyu%2Fdesktop%40${pkgver}/qianyu-${pkgver}-ubuntu-latest.AppImage")
sha256sums_x86_64=('6f828129243b66e7e1f80c313412a37e7338798a170e45d0ce57dbd1e02758fe')

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  cd "${srcdir}"
  # Extract AppImage to get the icon and desktop file
  ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install the AppImage
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/qianyu/qianyu.AppImage"

  # Create executable symlink mapping
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/qianyu/qianyu.AppImage" "${pkgdir}/usr/bin/qianyu"

  # Install Desktop entry and Icon
  # Note: adjust the paths inside squashfs-root based on your AppImage contents

  # Assuming app uses Qianyu.png or qianyu.png
  if [ -f "${srcdir}/squashfs-root/Qianyu.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/Qianyu.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qianyu.png"
  elif [ -f "${srcdir}/squashfs-root/qianyu.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/qianyu.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qianyu.png"
  fi

  # Adjust desktop file to run the installed AppImage and put it in correct place
  if [ -f "${srcdir}/squashfs-root/qianyu.desktop" ]; then
    install -Dm644 "${srcdir}/squashfs-root/qianyu.desktop" "${pkgdir}/usr/share/applications/qianyu.desktop"
    sed -i "s|^Exec=.*|Exec=/usr/bin/qianyu --no-sandbox %U|" "${pkgdir}/usr/share/applications/qianyu.desktop"
    sed -i "s|^Icon=.*|Icon=qianyu|" "${pkgdir}/usr/share/applications/qianyu.desktop"
  fi
}
