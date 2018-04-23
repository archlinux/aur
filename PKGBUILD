# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=sourcetrail
_pkgname=Sourcetrail
pkgver=2018.2.18
_pkgver=${pkgver/\./\_}
pkgrel=1
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('x86_64')
url='https://www.sourcetrail.com'
license=('custom')
conflicts=('coati')
replaces=('coati')
makedepends=('rsync')
provides=("${pkgname}=${pkgver}")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads/${pkgver}/linux/64bit/"
        "${pkgname}.desktop")
sha256sums=('255b0d6e6659262b6df28b03cc72c5263e549dbad4f548771d3c91256135ae5f'
            '9254abd7c73b70d3b81a40a6993b8c305cd24535aafe0eedffcd280f7fae2a3d')
noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${pkgver}.tar.gz" \
         -C "${srcdir}/opt/${pkgname}"
}

package() {
  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/data/gui/icon/logo_1024_1024.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  ln -s "/opt/${pkgname}/EULA.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${pkgname}"
}
