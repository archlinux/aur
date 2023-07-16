# Merged with official ABS snappy PKGBUILD by João, 2023/06/03 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=snappy-git
pkgver=1.1.10_r345.g27f34a5
pkgrel=1
pkgdesc='A fast compressor/decompressor library'
arch=($CARCH)
url="https://github.com/google/${pkgname%-git}"
license=(BSD)
checkdepends=(zlib)
makedepends=(git cmake clang gtest benchmark)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git" "snappy.pc.in" "cmake_add_pkgconfig.patch")
sha256sums=('SKIP'
            '134f06ca0584a1026538d0fb972fc141c008390ecae1806184b721eca1abbc75'
            '2a204d7d35509ffc290d80c641fcb7e8488c67ca550aa1695493cff12c53156b')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe --tags | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  cp ../snappy.pc.in .
  patch -p1 < ../cmake_add_pkgconfig.patch # https://bugs.archlinux.org/task/71246
#   patch -p1 < ../system_gtest.patch # https://github.com/google/snappy/pull/132
#   patch -p1 < ../reenable_rtti.patch # https://bugs.archlinux.org/task/72058
#   patch -p1 < ../fix_inline.patch # https://github.com/google/snappy/pull/128
}

build() {
  cd "${pkgname%-git}"

  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  # export CXX=clang++

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=yes \
    -DSNAPPY_USE_BUNDLED_GTEST=OFF \
    -DSNAPPY_USE_BUNDLED_BENCHMARK_LIB=OFF \
    .

  make
}

check() {
  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  make -C "${pkgname%-git}" test
}

package() {
  cd "${pkgname%-git}"

  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/snappy/LICENSE"
}
