# Contributor: Filip Brcic <brcha@gna.org>
_qt_module=qtdeclarative
pkgname=mingw-w64-qt5-declarative
pkgver=5.4.2
pkgrel=1
arch=(any)
pkgdesc="Classes for QML and JavaScript languages (mingw-w64)"
depends=(mingw-w64-qt5-base)
makedepends=(mingw-w64-gcc python)
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=("custom, FDL, GPL3, LGPL")
url="http://qt-project.org"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-build-qmldevtools-as-shared-library.patch")
md5sums=('5b257cd097c315dab1b3c15e26211823'
         '9caacc92a58eb05c3567ecc67ba433c4')

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

    # Something is messed up with Qt5Bootstrap
    make qmake_all
    find ./src -type f -exec sed -i "s|-L/usr/${_arch}/lib -lQt5Bootstrap|/usr/lib/libstdc++.so.6 /usr/lib/libm.so -L/usr/${_arch}/lib -lQt5Bootstrap|g" {} \;
    find . -type f -exec sed -i "s|-L/usr/${_arch}/lib -lQt5Bootstrap|/usr/lib/libstdc++.so.6 /usr/lib/libm.so -L/usr/${_arch}/lib -lQt5Bootstrap|g" {} \;
    find ./src -type f -exec sed -i "s|-L/usr/${_arch}/lib -lQt5QmlDevTools|/usr/lib/libstdc++.so.6 -L/usr/${_arch}/lib -lQt5QmlDevTools|g" {} \;
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
    rm "${pkgdir}/usr/${_arch}/lib/pkgconfig/Qt5QmlDevTools.pc"
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" -o -name '*.prl' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
    popd
  done
}
