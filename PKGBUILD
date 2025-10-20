# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=lib32-fmt
pkgver=12.0.0
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
b2sums=('3cc82aae85fc4283e28360b13d3a11eb0b1e8bbe59f4db9ad63fc9806c73d028298ca1b6ab0033a31a311054d7111d299db52a99203cb4d97be56bee7aad232f')

#pkgver() {
#  cd fmt
#  git describe --tags
#}

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
