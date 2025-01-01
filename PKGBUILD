pkgname=dpdk-lts
pkgver=24.11.1
pkgrel=1
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=($CARCH)
url='http://dpdk.org'
license=(
  BSD-3-Clause
  GPL-2.0-only
)
provides=(${pkgname%-lts})
conflicts=(${pkgname%-lts})
options=()
depends=(
  sh
  dtc
  gcc-libs
  glibc
  jansson
  libarchive
  libbsd
  libbpf
  libelf
  libpcap
  libxdp
  numactl
  rdma-core
  openssl
  python-scapy
  python-pyelftools
  zlib
  #AUR
  dlpack
  isa-l
)
makedepends=(
  doxygen
  cmake
  ninja
  meson
  man-db
  python-sphinx

)
checkdepends=()
source=(
  "http://fast.dpdk.org/rel/dpdk-$pkgver.tar.xz"
)
sha256sums=('bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e')

prepare() {
  meson subprojects download --sourcedir="${srcdir}/dpdk-stable-$pkgver"
}

build() {
  #   cd dpdk-$pkgver
  #   make T=x86_64-native-linuxapp-gcc
  cd "${srcdir}/dpdk-stable-$pkgver"
  arch-meson build
  ninja -C build
}

# check() {
#   cd dpdk-$pkgver
#   # tests fail
#   make test T=x86_64-native-linuxapp-gcc
# }

package() {
  DESTDIR="${pkgdir}" ninja -C ${srcdir}/dpdk-stable-$pkgver/build install
  #   cd dpdk-$pkgver
  #   make DESTDIR="$pkgdir" prefix=/usr sbindir=bin install T=x86_64-native-linuxapp-gcc
  #   cp -a "$pkgdir"/lib/ "$pkgdir"/usr/ && rm -rf "$pkgdir"/lib/
}
