# Maintainer: ant32 <antreimer@gmail.com>
_qt_module=qtlocation
pkgname=mingw-w64-qt5-location
pkgver=5.4.2
pkgrel=1
arch=(any)
pkgdesc="Provides access to position, satellite and area monitoring classes (mingw-w64)"
depends=(mingw-w64-qt5-base mingw-w64-qt5-declarative)
makedepends=(mingw-w64-gcc)
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=("custom, FDL, GPL3, LGPL")
url="http://qt-project.org"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('6f8843d44ff15196d1e93077cd24388c')

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
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" -o -name '*.prl' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
    popd
  done
}
