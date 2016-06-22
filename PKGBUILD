# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtgamepad
pkgname="mingw-w64-qt5-gamepad"
pkgver=5.7.0
pkgrel=1
arch=('any')
pkgdesc="Adds support for getting events from gamepad devices (mingw-w64)"
depends=('mingw-w64-qt5-base' 'mingw-w64-sdl2')
optdepends=('mingw-w64-qt5-declarative: QML bindings')
makedepends=('mingw-w64-gcc' 'mingw-w64-qt5-declarative')
license=('GPL3' 'LGPL')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('8531048533415712ec8c52d50239f8b3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make INSTALL_ROOT="${pkgdir}" install
    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a
    popd
  done

  # .prl files aren't interesting for us
  find "${pkgdir}" -name "*.prl" -delete
}
