# Maintainer: Kendall G. <kgarner at duck dot com>

pkgname=feishin-appimage
pkgver=0.1.1
pkgrel=1
pkgdesc="Sonixd Rewrite"
arch=('x86_64')
url="https://github.com/jeffvli/feishin"
provides=("feishin")
license=('GPL3')
depends=('fuse2' 'mpv')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
conflicts=("feishin-bin")
_filename=Feishin-${pkgver//_/-}-linux-$CARCH.AppImage
source=("${url}/releases/download/v${pkgver//_/-}/${_filename}")
sha256sums=("1fae2792ce6367d408f4525f9e2f6b6d95427fa03f044febb8b1f4c97a114e4b")
INSTALL_PATH="/opt/${pkgname}/${_filename}"

prepare() {
  chmod +x $_filename
  mkdir -p squashfs-root/usr/share/icons/hicolor
  ./$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/feishin.png" > /dev/null 2>&1
  ./$_filename --appimage-extract feishin.desktop > /dev/null 2>&1
}

build() {
  sed -i -E "s|Exec=AppRun|Exec=${INSTALL_PATH}|" squashfs-root/feishin.desktop
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # install icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  chmod -R 755 "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type f -name "feishin.png" -exec chmod 644 {} \;

  # install .desktop file and image file
  install -Dm644 "squashfs-root/feishin.desktop" "${pkgdir}/usr/share/applications/feishin.desktop"
  install -Dm755 "${_filename}" "${pkgdir}${INSTALL_PATH}"
}
