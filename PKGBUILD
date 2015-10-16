pkgname=mingw-w64-qt5-feedback
pkgver=0.0.0.20150918
_commit=28ca62414901502189ea28ef2efd551386187619
pkgrel=1
arch=(any)
pkgdesc="Qt Tactile Feedback Add-on Module (mingw-w64)"
license=("custom" "FDL" "GPL3" "LGPL")
depends=(mingw-w64-qt5-declarative)
makedepends=(mingw-w64-qt5-base git)
options=(staticlibs !strip !buildflags)
url="https://github.com/qtproject/qtfeedback"
source=("git+https://github.com/qtproject/qtfeedback.git#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd qtfeedback
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-qmake-qt5 ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/qtfeedback/build-${_arch}"
    make INSTALL_ROOT="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -o -name '*.a' | xargs ${_arch}-strip -g
  done
}
