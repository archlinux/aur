# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=librepcb-appimage
pkgver=0.1.0_rc1
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards."
arch=('x86_64')
url="http://librepcb.org/"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils' 'shared-mime-info' 'openssl' 'zlib')
makedepends=()
provides=('librepcb')
conflicts=('librepcb')
install=${pkgname}.install
_appimage="librepcb-${_pkgver}-linux-${arch}.AppImage"
noextract=("${_appimage}")
options=('!strip' '!emptydirs')
source=("https://download.librepcb.org/releases/${_pkgver}/${_appimage}")
sha256sums=('82dcf96f2d301330094adda16aae3e01fdf9a7fdd195995db13a22516f0adc31')

build() {
  chmod +x ${_appimage}
  ./${_appimage} --appimage-extract 2>/dev/null
  chmod -x ${_appimage}
}

package() {
  # Appimage
  install -D -m755 "${srcdir}/${_appimage}" "${pkgdir}/usr/local/bin/librepcb"

  # Metadata
  mkdir -p "${pkgdir}/usr/share"
  cp -R "squashfs-root/opt/share/applications" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/icons" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/metainfo" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/mime" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
