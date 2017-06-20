pkgname=dpdk-lts
pkgver=16.11.2
pkgrel=1
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=(x86_64 i686)
url='http://dpdk.org'
license=(BSD)
options=(staticlibs)
depends=()
makedepends=(linux-headers libpcap)
checkdepends=()
source=(
    "http://fast.dpdk.org/rel/dpdk-$pkgver.tar.xz"
    'dpdk-dev-mk-disable-new-gcc-truncation-flag.patch'
)
sha256sums=(
    '59003b90b0037e2e88f9819b9305529717261562'
    '1fc942c4484e2a54d2cc725ae0b2383ea13188f7'
)

prepare() {
  cd dpdk-stable-$pkgver
  make T=x86_64-native-linuxapp-gcc config

  sed -ri 's,(RTE_MACHINE=).*,\1default,'    build/.config
  sed -ri 's,(RTE_APP_TEST=).*,\1n,'         build/.config
  sed -ri 's,(RTE_BUILD_SHARED_LIB=).*,\1y,' build/.config
  sed -ri 's,(RTE_NEXT_ABI=).*,\1n,'         build/.config
  sed -ri 's,(LIBRTE_VHOST=).*,\1y,'         build/.config
  sed -ri 's,(LIBRTE_PMD_PCAP=).*,\1y,'      build/.config
  #sed -ri 's,(LIBRTE_PMD_XENVIRT=).*,\1y,'   build/.config

  sed 's|\bpython\b|python2|' -i mk/rte.sdktest.mk

  patch -p1 -i "${srcdir}/dpdk-dev-mk-disable-new-gcc-truncation-flag.patch"
}

build() {
  cd dpdk-stable-$pkgver
  make T=x86_64-native-linuxapp-gcc
}

check() {
  cd dpdk-stable-$pkgver
  # tests fail
  make test T=x86_64-native-linuxapp-gcc
}

package() {
  cd dpdk-stable-$pkgver
  make DESTDIR="$pkgdir" prefix=/usr sbindir=bin install T=x86_64-native-linuxapp-gcc
  cp -a "$pkgdir"/lib/ "$pkgdir"/usr/ && rm -rf "$pkgdir"/lib/
}
