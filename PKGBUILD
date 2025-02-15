# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=lib32-fmt
pkgver=11.1.3
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
b2sums=('cab07694562864d5549cffc87ecf3553be7bb8b8a4bc20fe105723b2ac0406aec12167cddc7f9cdbc247d3203cc122cef1b93e3b04efcb6171d5e46e66555fa5')

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
