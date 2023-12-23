# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=lib32-fmt
pkgver=10.1.1
pkgrel=2
pkgdesc='Open-source formatting library for C++'
arch=(x86_64)
url=https://fmt.dev
license=(MIT)
depends=(fmt lib32-gcc-libs lib32-glibc)
makedepends=(
  cmake
  git
  ninja
)
_tag=f5e54359df4c26b6230fc61d38aa294581393084
source=(
  git+https://github.com/fmtlib/fmt.git#tag=${_tag}
  "https://gitlab.archlinux.org/archlinux/packaging/packages/fmt/-/raw/main/fmt-no-pip-no-virtualenv.patch"
)
b2sums=('SKIP'
        '4e19e7b2cd8fd049b7c692c0efbc4b2f1dd6062f44a600f4f47be81ed0ed14defb4285eb09b8d8fb8bb55441689c3a659e157e91d2cdd94e4d7b00c28b6534f2')

prepare() {
  cd fmt
  patch -Np1 -i ../fmt-no-pip-no-virtualenv.patch
}

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

  install -Dm 644 fmt/LICENSE.rst -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
