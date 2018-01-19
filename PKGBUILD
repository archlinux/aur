pkgname=mingw-w64-qwt-qt4
pkgver=6.1.3
pkgrel=2
pkgdesc="Qt Widgets for Technical Applications (mingw-w64, qwt-qt4.dll only)"
arch=('any')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw-w64-qt4')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
md5sums=('19d1f5fa5e22054d22ee3accc37c54ba')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    
  for _arch in ${_architectures}; do

    export QTDIR=/usr/${_arch}/
    export PATH=${QTDIR}/bin:${PATH}
    cd "${srcdir}"
    mkdir -p ${pkgname}-${pkgver}-build-${_arch}
    cp -r "qwt-${pkgver}/" "${pkgname}-${pkgver}-build-${_arch}"
    cd ${pkgname}-${pkgver}-build-${_arch}/qwt-${pkgver}
    

    # Build release only
    sed -i 's|+= debug_and_release|+= release|' qwtbuild.pri
    sed -i '/+= build_all/d' qwtbuild.pri

    # No designer plugin:
    sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

    # This is a mingw build, so Windows prefix is used. Let's change it:
    sed -i "s|C:/Qwt-\$\$QWT_VERSION|/usr/${_arch}|" qwtconfig.pri

    # Make install locations consistent with Arch's native Qwt:
    sed -i 's|$${QWT_INSTALL_PREFIX}/doc|$${QWT_INSTALL_PREFIX}/share/doc/qwt|' qwtconfig.pri
    sed -i 's|$${QWT_INSTALL_PREFIX}/include|$${QWT_INSTALL_PREFIX}/include/qwt-qt4|' qwtconfig.pri

    # No need for docs:
    sed -i "s|= target doc|= target|" src/src.pro

    ${QTDIR}/bin/qmake qwt.pro

    # rename to qwt-qt4
    make sub-src-qmake_all
    sed -i "s|lib/libqwt.a|lib/libqwt-qt4.dll.a|g" src/Makefile.Release
    sed -i "s|qwt.dll|qwt-qt4.dll|g" src/Makefile.Release

    make
  done

}

package() {

  for _target in ${_architectures}; do

    cd "${srcdir}/${pkgname}-${pkgver}-build-${_target}/qwt-${pkgver}"

    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_target}/ install

    cd "${pkgdir}/usr/${_target}"

    # Move DLLs from lib to bin
    mkdir -p bin
    mv lib/*.dll bin/
    ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
    ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
    rm -r "$pkgdir"/usr/${_target}/share "$pkgdir"/usr/${_target}/features
  done
}
