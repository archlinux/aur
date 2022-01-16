pkgname=mingw-w64-cubeb-git
pkgver=r1491.9edd150
pkgrel=1
arch=('any')
pkgdesc="A cross platform audio library (mingw-w64)"
depends=('mingw-w64-speex')
makedepends=('mingw-w64-cmake')
provides=('mingw-w64-cubeb')
conflicts=('mingw-w64-cubeb')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL2')
url="https://github.com/mozilla/cubeb"
source=("git+https://github.com/mozilla/cubeb" "git+https://github.com/arsenm/sanitizers-cmake")
sha256sums=('SKIP' 'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${srcdir}"/cubeb
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/cubeb
  git submodule init
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git submodule update
}

build() {
  cd "${srcdir}"/cubeb
  ls -l
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    pwd
    ${_arch}-cmake -DBUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cubeb/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
