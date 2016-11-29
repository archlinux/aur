# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=lazpaint-qt4
_pkgname=lazpaint
pkgver=6.4.1
_inetver=0.6.6
_bgrabitmapver=9.2.2
_bgracontrolsver=4.3.2
pkgrel=4
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal).'
arch=(i686 x86_64)
url='http://sourceforge.net/projects/lazpaint/'
license=(GPL3 LGPL)
depends=(qt4pas)
makedepends=(lazarus unzip)
provides=("${_pkgname}")
conflicts=("${_pkgname}-gtk2")
install="${_pkgname}.install"
source=("http://downloads.sourceforge.net/project/${_pkgname}/src/${_pkgname}${pkgver}_src.zip"
        "http://downloads.sourceforge.net/project/${_pkgname}/src/inet${_inetver}.zip"
        "http://downloads.sourceforge.net/project/${_pkgname}/src/oldbgrabitmap/bgrabitmap${_bgrabitmapver}.zip"
        "https://github.com/bgrabitmap/bgracontrols/archive/v${_bgracontrolsver}.zip"
        "${_pkgname}.desktop"
        "${_pkgname}.png"
        "language_path_fix.patch")
md5sums=('2e7896bd5bf936a7addd92077b85a6f8'
         '63e9ae30886fdd3ee309a12bdc0ff613'
         'e04993077bb4d4b27b0f80d0b4448375'
         '28bcb8541440fcbec1693cd1aae1959e'
         'e6f4f8c4d9456b21ed4a25d7b775fec4'
         '8f26062ad1e3222d375201d96341716c'
         '432a9cea4a7bde018869b5a2ee5af7c3')
_ws=qt

prepare() {
  cd "${srcdir}"

  patch -p0 < language_path_fix.patch

  mkdir "${srcdir}/config"
}

build() {
  cd "${srcdir}/inet${_inetver}/lazaruspackage"
  lazbuild lnetvisual.lpk --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path="${srcdir}/config"
  cd "${srcdir}/bgrabitmap${_bgrabitmapver}"
  lazbuild bgrabitmappack.lpk --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path="${srcdir}/config"
  cd "${srcdir}/bgracontrols-${_bgracontrolsver}"
  lazbuild bgracontrols.lpk --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path="${srcdir}/config"
  cd "${srcdir}/${_pkgname}"
  lazbuild "${_pkgname}.lpi" --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path="${srcdir}/config" --build-mode=Release
}

package() {
  cd "${srcdir}/${_pkgname}/release"

  install -D -m 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/${_pkgname}/i18n"
  install -D -m 644 i18n/*.po "${pkgdir}/usr/share/${_pkgname}/i18n"

  install -D -m 644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m 644 "${srcdir}/${_pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
