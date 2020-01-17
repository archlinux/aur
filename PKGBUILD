# Maintainer:  Zhiwei Chen <condy0919@gmail.com>

_pkgname=hotspot
pkgname="${_pkgname}"-appimage
pkgver=1.2.0
pkgrel=2
pkgdesc="The Linux perf GUI for performance analysis."
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL')
depends=('perf' 'fuse')
conficts=('hotspot')
provides=('hotspot')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/KDAB/hotspot/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64.AppImage"
              )
md5sums_x86_64=('c2054e28bff59894927d555d1d70beb9')
noextract=("${_appimage}")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/opt
}

package() {
  # AppImage
  install -Dm755 "${_appimage}" \
          "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "squashfs-root/${_pkgname}.desktop" \
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  cp -a "squashfs-root/opt/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" \
     "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
