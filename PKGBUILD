# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=lib32-fmt
pkgver=11.0.2
pkgrel=1
pkgdesc='Open-source formatting library for C++'
arch=(x86_64)
url="https://github.com/fmtlib/fmt"
license=(MIT)
depends=(fmt lib32-gcc-libs lib32-glibc)
makedepends=(
  cmake
  git
  ninja
)
source=(git+https://github.com/fmtlib/fmt.git#tag=${pkgver})
b2sums=('18b6d66c2159b2f8bd0baf2e1df7514fde09cf6a25441710d40e386abd9baa49b62859c4d8a71b77f0d1550c32fc62826c95fdacf4397e24cc6ea205a0c50798')

pkgver() {
  cd fmt
  git describe --tags
}

build() {
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -S fmt -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DFMT_DOC:BOOL=ON \
    -DBUILD_SHARED_LIBS=ON

  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  rm -rf "${pkgdir}"/usr/{include,share}

  install -Dm 644 fmt/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
