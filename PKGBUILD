pkgname=mingw-w64-papilo
pkgver=3.0.2
pkgrel=1
pkgdesc="Parallel Presolve for Integer and Linear Optimization (mingw-w64)"
arch=('any')
url='https://www.scipopt.org/'
license=(LGPL-3.0-only)
depends=('mingw-w64-blas' 'mingw-w64-boost' 'mingw-w64-gmp' 'mingw-w64-onetbb')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/scipopt/papilo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ab6e4a41667aa1edc87697dfcc0dc7d517d047d4366abafd8858d22e02d4f2f')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/papilo-${pkgver}"
  #curl -L https://gitlab.archlinux.org/archlinux/packaging/packages/papilo/-/raw/main/shared-libs.patch?ref_type=heads | patch -p1
}

build() {
  cd "${srcdir}/papilo-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DBUILD_TESTING=OFF -DPAPILO_NO_BINARIES=ON .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/papilo-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

