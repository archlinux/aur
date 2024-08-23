# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=lib32-fmt
pkgver=10.2.0
pkgrel=1
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
source=(git+https://github.com/fmtlib/fmt.git#tag=${pkgver}
        "https://gitlab.archlinux.org/archlinux/packaging/packages/fmt/-/raw/${pkgver}-1/fmt-no-pip-no-virtualenv.patch")
b2sums=('SKIP'
        '0bc421afdc4c2527525ce2e21740c9f72e05431394fb4710c1a8fa6d3bb2ee20d0630e2a76ddbac3c0ba27c1ab08f0c8e27d060def1370721b1c94246cbbf0ff')

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

  install -Dm 644 fmt/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
