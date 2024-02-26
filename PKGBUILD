# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgname=pcapplusplus-git
pkgver=23.09.r80.ga93506c9
pkgrel=1
pkgdesc="A multi-platform C++ library for capturing, parsing and crafting of network packets"
arch=("x86_64")
url="https://pcapplusplus.github.io/"
license=('Unlicense')
makedepends=("git")
depends=("libpcap" "glibc" "gcc-libs" "zstd")
source=("pcapplusplus::git+https://github.com/seladb/PcapPlusPlus.git")
sha256sums=('SKIP')

pkgver() {
  cd "pcapplusplus"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/\./g'
}

build() {
  cd "pcapplusplus"
  mkdir -p "build"
  cd build

  #if zstd is not needed, set -DLIGHT_PCAPNG_ZSTD=OFF
  #examples may be built and installed under /usr/bin folder. If needed set -DPCAPPP_BUILD_EXAMPLES=ON

  cmake -DLIGHT_PCAPNG_ZSTD=ON -DPCAPPP_BUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib/pcapplusplus' ..
  make

  #alternative UNTESTED compilation script
  #cmake -DPCAPPP_BUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib/pcapplusplus' -S . -B build
  #cmake --build build
}

package() {
  cd "$srcdir/pcapplusplus/build"
  make DESTDIR="$pkgdir" install
}
