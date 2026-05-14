pkgname=mingw-w64-qwt-qt5
pkgver=6.3.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="https://qwt.sourceforge.io/"
depends=('mingw-w64-qt5-svg')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
sha256sums=('dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a')

_architectures="x86_64-w64-mingw32"

prepare() {
  cd qwt-${pkgver}
  # Build release only
  sed -i 's|+= debug_and_release|+= release|' qwtbuild.pri
  sed -i '/+= build_all/d' qwtbuild.pri

  # No designer plugin:
  sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

  # Make install locations consistent with Arch's native Qwt:
  sed -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i qwtconfig.pri

  sed -e "/QwtExamples/d" -e "/QwtTests/d" -e "/QwtPlayground/d" -i qwtconfig.pri
}

build() {
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}/lib/qt
    export PATH=${QTDIR}/bin:${PATH}
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}"
    cp -r "qwt-${pkgver}/" "${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/qwt-${pkgver}"

    # This is a mingw build, so Windows prefix is used. Let's change it:
    sed -i "s|C:/Qwt-\$\$QWT_VERSION|/usr/${_arch}|" qwtconfig.pri

    ${QTDIR}/bin/qmake qwt.pro
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/qwt-${pkgver}"
    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_arch}/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    install -d "${pkgdir}"/usr/${_arch}/bin
    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
