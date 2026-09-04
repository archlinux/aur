# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=vectorscan
pkgver=5.4.13
pkgrel=5
pkgdesc='Portable fork of hyperscan regular expression matching library'
arch=(x86_64)
url=https://github.com/VectorCamp/vectorscan
license=("BSD-3-Clause")
makedepends=(
  boost
  cmake
  ninja
  pcre
  ragel
  simde
)
depends=(
  libgcc
  libstdc++
  glibc
)
optdepends=(
  vectorscan-docs # local copy of the vectorscan API documentation
)
options=(!lto)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}/${pkgver}.tar.gz"
  "fix-makefile-for-documentation.patch"
)
b2sums=('7d229b100e99d1b4dae0d62d5449074f0a0b7166e2c183db0641adaec38fad4f216dea22b550802e203afc065175d0a4656c770d9405a03363a2586776da9ff8'
        'b9d0fb1559a050ca0d4210b9587618e469303dc0044c6ccf289c5bfecb8ab03b268de6d3b8005eb042ceaaab1335ed1dbe3b2434a4b8409b58782080193dd382')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  echo "Patching Makefile for documentation deps (see https://github.com/VectorCamp/vectorscan/issues/411)"
  echo "API docs are provided in https://aur.archlinux.org/packages/vectorscan-docs"
  patch -p1 < ../fix-makefile-for-documentation.patch
}

build() {
  cd "${srcdir}"
  cmake -S "${pkgname}-${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DOCS=OFF \
    -Wno-author
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 "${pkgname}-${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
