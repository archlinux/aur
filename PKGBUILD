# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtserialport
pkgname="mingw-w64-qt5-serialport"
pkgver=5.7.0
pkgrel=1
arch=('any')
pkgdesc="Provides access to hardware and virtual serial ports (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('LGPL')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-$pkgver"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/$pkgver/submodules/qtserialport-opensource-src-$pkgver.tar.xz")
md5sums=('f93cc8b36964c6aa965c27c3acd12f82')

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
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.dll.a
    #${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*t.a
  done

  # .prl files aren't interesting for us
  find ${pkgdir} -name "*.prl" -delete
}
