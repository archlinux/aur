# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ohmyarch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtdeclarative
pkgname=mingw-w64-qt5-declarative
pkgver=5.7.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Classes for QML and JavaScript languages (mingw-w64)"
depends=(mingw-w64-qt5-base)
makedepends=(mingw-w64-gcc python)
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=("custom, FDL, GPL3, LGPL")
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-build-qmldevtools-as-shared-library.patch")
md5sums=('0d9e461aa54dba4793253fa2eb501f9b'
         '8f90ec8c2379b85de0b04847865b230c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgfqn}"
  patch -p1 -i "${srcdir}"/qt5-build-qmldevtools-as-shared-library.patch
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-qmake-qt5 ../${_qt_module}.pro

    # search paths for host standard library (/usr/lib) and for Qt5Bootstrap (/usr/$_arch/lib) are not set correctly by qmake
    # hence we need insert those paths manually
    make qmake_all
    find ./src/qmldevtools -type f -iname 'Makefile' -exec sed -i "s|-lQt5Bootstrap|-L/usr/lib -L/usr/$_arch/lib -lQt5Bootstrap|g" {} \;
    find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -lQt5Bootstrap|-L/usr/lib -L$PWD/lib -L/usr/$_arch/lib -lQt5Bootstrap|g" {} \;
    find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -lQt5QmlDevTools -lQt5Bootstrap|-L/usr/lib -L$PWD/lib -L/usr/$_arch/lib -lQt5QmlDevTools -lQt5Bootstrap|g" {} \;

    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make INSTALL_ROOT="$pkgdir" install
    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" -o -name '*.prl' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
    strip --strip-all "${pkgdir}/usr/${_arch}/lib/qt/bin/"*
    strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.so.$pkgver
    popd
  done
}
