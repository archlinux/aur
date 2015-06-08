# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=lazpaint-qt4
_pkgname=lazpaint
pkgver=6.4.1
_inetver=0.6.6
_bgrabitmapver=8.5.1
_bgracontrolsver=3.6-2015-05-02
pkgrel=2
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal).'
arch=(i686 x86_64)
url='http://sourceforge.net/projects/lazpaint/'
license=(GPL3 LGPL)
depends=(qt4pas)
makedepends=(lazarus unzip)
provides=(${_pkgname})
conflicts=(${_pkgname}-gtk2)
install=${_pkgname}.install
source=(http://downloads.sourceforge.net/project/${_pkgname}/src/${_pkgname}${pkgver}_src.zip
        http://downloads.sourceforge.net/project/${_pkgname}/src/inet${_inetver}.zip
        http://downloads.sourceforge.net/project/${_pkgname}/src/bgrabitmap${_bgrabitmapver}.zip
        http://downloads.sourceforge.net/project/bgra-controls/bgra-controls-3.0/bgracontrols-${_bgracontrolsver}.zip
        ${_pkgname}.desktop
        ${_pkgname}.png
        language_path_fix.patch
        bgrabitmap_disable_optimization.patch
        bgrabitmap_fix_qt_compilation.patch)
md5sums=(2ac6eaeedbda6332028a659fdcd58045
         63e9ae30886fdd3ee309a12bdc0ff613
         f276aa0153d8f04288e28ad6a430eff6
         f9c699fc31221355defef022cfb41ef7
         e6f4f8c4d9456b21ed4a25d7b775fec4
         8f26062ad1e3222d375201d96341716c
         432a9cea4a7bde018869b5a2ee5af7c3
         ac1568044af330d53da5d4b27797dbf7
         3349a78f598d8e5ef4a753d3fb3f75b1)
_ws=qt

prepare() {
  cd ${srcdir}

  patch -p0 < language_path_fix.patch
  # http://sourceforge.net/p/lazpaint/bugs/20/
  patch -p0 < bgrabitmap_disable_optimization.patch
  # http://sourceforge.net/p/lazpaint/bugs/21/
  patch -p0 < bgrabitmap_fix_qt_compilation.patch

  mkdir config
}

build() {
  cd ${srcdir}/inet${_inetver}/lazaruspackage
  lazbuild lnetvisual.lpk --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path=${srcdir}/config
  cd ${srcdir}/bgrabitmap${_bgrabitmapver}
  lazbuild bgrabitmappack.lpk --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path=${srcdir}/config
  cd ${srcdir}/bgracontrols
  lazbuild bgracontrols.lpk --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path=${srcdir}/config
  cd ${srcdir}/${_pkgname}
  lazbuild ${_pkgname}.lpi --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path=${srcdir}/config --build-mode=Release
}

package() {
  cd ${srcdir}/${_pkgname}/release

  install -D -m 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/i18n
  install -D -m 644 i18n/*.po ${pkgdir}/usr/share/${_pkgname}/i18n

  install -D -m 644 ${srcdir}/${_pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -D -m 644 ${srcdir}/${_pkgname}.png \
    ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
}
