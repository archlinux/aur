# Maintainer: ant32 <antreimer@gmail.com>
_qt_module=qtserialport
pkgname="mingw-w64-qt5-serialport"
pkgver=5.4.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtSerialPort module (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('LGPL')
url="http://qt-project.org/wiki/QtSerialPort"
_pkgfqn="${_qt_module}-opensource-src-$pkgver"
source=("http://download.qt-project.org/official_releases/qt/5.4/$pkgver/submodules/qtserialport-opensource-src-$pkgver.tar.xz")
md5sums=('546a62eee89722081b7ec13d72469772')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgfqn}"
  
  # don't build examples or tests.
  sed -i 's/ examples tests//' qtserialport.pro

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}/include/QtSerialPort && pushd build-${_arch}
    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make
    popd
    
    #mkdir -p static-${_arch}/include/QtSerialPort && pushd static-${_arch}
    #${_arch}-qmake-qt5 ../${_qt_module}.pro CONFIG+=static
    #make
    #popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}

    make INSTALL_ROOT="${pkgdir}" install
    
    popd
    
    #pushd static-${_arch}
    #make INSTALL_ROOT="${pkgdir}" install
    #popd

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a
    #${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*t.a
  done

  # .prl files aren't interesting for us
  find ${pkgdir} -name "*.prl" -delete
}
