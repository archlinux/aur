# Maintainer: Neo Chen
# Based on the Arch Linux zerotier-one package maintained by Felix Yan.

pkgname=zerotier-one-full-netlink-fix
pkgver=1.16.2
pkgrel=1
pkgdesc='ZeroTier with nonfree controller and Linux netlink RTA_SRC length fix'
arch=('x86_64')
url='https://www.zerotier.com/'
license=('custom: ZeroTier SOURCE-AVAILABLE LICENSE')
depends=('glibc'
         'libgcc' 'libgcc_s.so'
         'libnatpmp' #'libnatpmp.so'
         'libstdc++' 'libstdc++.so'
         'miniupnpc' 'libminiupnpc.so'
         'openssl' 'libcrypto.so' 'libssl.so')
makedepends=('rust')
provides=("zerotier-one=${pkgver}"
          "zerotier-one-full=${pkgver}")
conflicts=('zerotier-one'
           'zerotier-one-full')
options=('!lto')
source=("zerotier-one-$pkgver.tar.gz::https://github.com/zerotier/ZeroTierOne/archive/refs/tags/$pkgver.tar.gz"
        '0001-miniupnpc.patch'
        'zerotier-one.sysusers'
        'netlink-rta-src-length.patch::https://github.com/zerotier/ZeroTierOne/commit/24062e4f9a4d79cf34540ed6c0da95d81214aa9b.patch')
sha512sums=('c955fe75930cdecb806b766aa3ae07f18dd2b4ee772d69f20375e043bdd3473d8e12fe530cfb8663f194fe63d5a66c545983be93b4c81b171fe4da930062ad7b'
            '552526633470e8bf7b5464b1c4ffb3102c62d05c9370b042bfa8447ccae213678f156e88604e8b9b01f1ee2197f62a7b7e4263279bf028eaa6471443bf67bdf3'
            '9499251dcd5cfb415e7cbfae33f17f40a1b9f94547df5edea9d94d6ecfa4b97e49eda1397d70968422e13b902ce0e591bd081bbec57c81465ff84bf5848851dd'
            '76415b304e5f14235eb96563db55047275008611b80284f2b39701507c6ed3bc7d7f4e58b81bd0aeafaef345b7fa1b8593d04b527572c69332be956c419974b6')

prepare() {
  cd "${srcdir}/ZeroTierOne-${pkgver}"

  # Remove bundled miniupnpc code and build with the packaged headers.
  # Also fix compatibility with MINIUPNPC_API_VERSION 18.
  rm -rf ext/miniupnpc/
  patch -Np1 < ../0001-miniupnpc.patch

  # Upstream PR #2533: account for RTA_SRC in the netlink message length.
  patch -Np1 < ../netlink-rta-src-length.patch

  sed \
    -e 's/sbin/bin/' \
    -e 's/LDFLAGS=/LDFLAGS?=/' \
    -e 's/RUSTFLAGS=/RUSTFLAGS?=/' \
    -e 's/cargo build $(RUSTFLAGS)/cargo build --release/' \
    -i make-linux.mk debian/zerotier-one.service
}

build() {
  cd "${srcdir}/ZeroTierOne-${pkgver}"
  make V=1 ZT_NONFREE=1
}

check() {
  cd "${srcdir}/ZeroTierOne-${pkgver}"
  make selftest
  ./zerotier-selftest
}

package() {
  cd "${srcdir}/ZeroTierOne-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m0644 debian/zerotier-one.service "${pkgdir}"/usr/lib/systemd/system/zerotier-one.service
  install -D -m0644 "${srcdir}"/zerotier-one.sysusers "${pkgdir}"/usr/lib/sysusers.d/zerotier-one.conf
  install -D -m0644 nonfree/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.md
}
