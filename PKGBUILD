# Maintainer: taotieren <admin@taotieren.com>

pkgname=dpdk-lts
pkgver=26.11
pkgrel=1
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=($CARCH)
url='http://dpdk.org'
license=(
  'BSD-3-Clause AND GPL-2.0-only'
)
provides=(${pkgname%-lts})
conflicts=(${pkgname%-lts})
depends=(
  sh
  dtc
  jansson
  libarchive
  libatomic
  libbsd
  libbpf
  libelf
  libpcap
  libxdp
  libz.so
  isa-l
  numactl
  rdma-core
  openssl
  python
  python-scapy
  python-pefile
  python-pyelftools
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
sha256sums=('392b7be5d830ecd6842ce12f5dbd530f8211c20efebc65e7992dfe15ee32ed33')

prepare() {
  meson subprojects download --sourcedir="${srcdir}/dpdk-$pkgver"
}

build() {
  cd "${srcdir}/dpdk-$pkgver"
  arch-meson build
  ninja -C build
}

# check() {
#   cd dpdk-$pkgver
#   # tests fail
#   make test T=x86_64-native-linuxapp-gcc
# }

package() {
  DESTDIR="${pkgdir}" ninja -C ${srcdir}/dpdk-$pkgver/build install
  install -Dm644 ${srcdir}/dpdk-$pkgver/license/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
