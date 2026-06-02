# Maintainer: LY <ly-niko@qq.com>

pkgname=sjtu-canvas-helper-appimage
_pkgname=sjtu-canvas-helper
pkgver=2.0.5
pkgrel=4
pkgdesc="SJTU Canvas Helper - 帮助您更快速便捷地使用上海交通大学课程平台 (AppImage)"
arch=('x86_64')
url="https://github.com/Young-Lord/SJTU-Canvas-Helper"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib')
makedepends=('fuse2')
options=('!strip')
_appimage="SJTU.Canvas.Helper_${pkgver}_amd64.AppImage"
source=("${_appimage}::${url}/releases/download/app-v${pkgver}/${_appimage}")
sha256sums=('17a855f46ba11e51b8daae271ceb6ba45c8e720b88fee82a8a0d5f04f3583596')
noextract=("${_appimage}")

prepare() {
  chmod +x "${srcdir}/${_appimage}"
  "${srcdir}/${_appimage}" --appimage-extract > /dev/null
  rm -f "${srcdir}/squashfs-root/usr/lib/"*wayland*
  chmod -R a-x+rX "${srcdir}/squashfs-root/usr/"
}

build() {
  sed -i "s|Icon=${_pkgname}|Icon=${pkgname}|" \
    "${srcdir}/squashfs-root/SJTU Canvas Helper.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/squashfs-root/SJTU Canvas Helper.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  for _dir in 16x16 32x32 64x64 128x128 256x256 256x256@2 scalable; do
    if [ -f "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/${_pkgname}.png" ]; then
      mv "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/${pkgname}.png"
    fi
  done
}
