pkgname=mingw-w64-qwt-qt6
pkgver=6.2.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw-w64-qt6-svg')
makedepends=('mingw-w64-gcc' 'qt6-base' 'subversion')
options=('staticlibs' '!strip' '!buildflags')
source=("svn+https://svn.code.sf.net/p/qwt/code/branches/qwt-6.2")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd qwt-6.2
  # Build release only
  sed -i 's|+= debug_and_release|+= release|' qwtbuild.pri
  sed -i '/+= build_all/d' qwtbuild.pri

  # No designer plugin:
  sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

  # Make install locations consistent with Arch's native Qwt:
  sed -i 's|$${QWT_INSTALL_PREFIX}/doc|$${QWT_INSTALL_PREFIX}/share/doc/qwt|' qwtconfig.pri
  sed -i 's|$${QWT_INSTALL_PREFIX}/include|$${QWT_INSTALL_PREFIX}/include/qwt|' qwtconfig.pri

  # No need for docs:
  sed -i "s|= target doc|= target|" src/src.pro
}

build() {
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}/lib/qt6
    export PATH=${QTDIR}/bin:${PATH}
    mkdir -p "${srcdir}/qwt-build-${_arch}"
    cd "${srcdir}"
    cp -r "qwt-6.2" "qwt-build-${_arch}"
    cd "${srcdir}/qwt-build-${_arch}/qwt-6.2"

    # This is a mingw build, so Windows prefix is used. Let's change it:
    sed -i "s|C:/Qwt-\$\$QWT_VERSION|/usr/${_arch}|" qwtconfig.pri

    ${QTDIR}/bin/qmake qwt.pro
    make
  done
}

package() {

  for _target in ${_architectures}; do

    cd "${srcdir}/qwt-build-${_target}/qwt-6.2"

    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_target}/ install

    cd "${pkgdir}/usr/${_target}"

    # Move DLLs from lib to bin
    mkdir -p bin
    mv lib/*.dll bin/
    ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
    ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
    # Move features to share/qt/mkspecs
    rm -rf "$pkgdir"/usr/${_target}/share
    mkdir -p lib/qt/mkspecs
    mv features lib/qt/mkspecs
  done
}
