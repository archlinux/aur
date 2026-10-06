# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=edax-reversi
_pkgname=edax
pkgver=4.6
pkgrel=2
pkgdesc="Edax is a very strong Othello (aka Reversi) engine"
arch=('x86_64')
url="https://github.com/abulmo/${pkgname}"
license=('GPL-3.0-only')
depends=('sh')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-linux-x86.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86.tar.gz"
	"edax-reversi"
)
sha256sums=('fccb76cc1b09697fccb07cf50bcedf9566223e8ebb1916584e0af185d0d380de'
            '7ca52cb0ccf591ad9690e7d21861d4a6f04b900c686346db98ea26dd30cd966a'
	    '4fb7528de6d7a71cd1ad4138951067a414c17e44738760f3efb18f9fe532040c')

prepare() {
   mv "${srcdir}/data" "${srcdir}/${pkgname}-${pkgver}/"
   mkdir "${srcdir}/${pkgname}-${pkgver}/bin"
   mv "${srcdir}/lEdax-x86-64" "${srcdir}/${pkgname}-${pkgver}/bin"
}

build() {
   cd "${srcdir}/${pkgname}-${pkgver}/src"
   CC=gcc make build ARCH="x86-64" OS=linux
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   install -d -m755 "${pkgdir}/usr"
   install -d -m755 "${pkgdir}/usr/bin"
   install -d -m755 "${pkgdir}/usr/lib"
   install -d -m755 "${pkgdir}/usr/lib/edax-reversi"
   install -d -m755 "${pkgdir}/usr/share"
   install -d -m755 "${pkgdir}/usr/share/edax-reversi"
   
   cp -r "${srcdir}/${pkgname}-${pkgver}/bin"     "${pkgdir}/usr/lib/edax-reversi"
   cp -r "${srcdir}/${pkgname}-${pkgver}/data"    "${pkgdir}/usr/lib/edax-reversi"
   cp -r "${srcdir}/${pkgname}-${pkgver}/problem" "${pkgdir}/usr/lib/edax-reversi"
   cp "${srcdir}/${pkgname}-${pkgver}/LICENSE"    "${pkgdir}/usr/share/edax-reversi"
   cp "${srcdir}/${pkgname}-${pkgver}/README.md"  "${pkgdir}/usr/share/edax-reversi"
   
   # as a final step, copy the provided executable script (edax-reversi) into /usr/bin:
   cp ../../edax-reversi "${pkgdir}/usr/bin/"
   chmod 755 "${pkgdir}/usr/bin/edax-reversi"
}
