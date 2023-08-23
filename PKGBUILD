# Maintainer: Emanuele Faranda <black.silver@hotmail.it>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>
# Arch Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=n2n-git
_pkgname=n2n
pkgver=3.1.1.r235.gcd7b3b4
pkgrel=1
pkgdesc="A Peer-to-peer VPN software which makes it easy to create virtual networks bypassing intermediate firewalls"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/ntop/n2n"
license=('GPL3')
depends=('libcap' 'openssl' 'miniupnpc' 'zstd')
optdepends=('libpcap: for n2n-decode')
makedepends=('git' 'libpcap')
provides=(n2n)
conflicts=(n2n)
backup=('etc/n2n/edge.conf'
        'etc/n2n/supernode.conf')
source=('git+https://github.com/ntop/n2n.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i 's|/sbin|/bin|' Makefile
  sed -i 's|/usr/sbin|/usr/bin|' packages/etc/systemd/system/*.service

  # We need a better way to make the conf file owned by the user created in sysusers.d...
  sed -i '/User=n2n/d;/Group=n2n/d' packages/etc/systemd/system/supernode.service
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --with-zstd --with-openssl --enable-miniupnp --enable-pcap --enable-cap --enable-pthread
  make
}

package() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" SBINDIR="$pkgdir"/usr/bin make install

  install -Dm600 packages/etc/n2n/edge.conf.sample "$pkgdir"/etc/n2n/edge.conf
  install -Dm600 packages/etc/n2n/supernode.conf.sample "$pkgdir"/etc/n2n/supernode.conf
  install -Dm644 packages/etc/systemd/system/edge.service "$pkgdir"/usr/lib/systemd/system/edge.service
  install -Dm644 packages/etc/systemd/system/edge@.service "$pkgdir"/usr/lib/systemd/system/edge@.service
  install -Dm644 packages/etc/systemd/system/edge-ntopng@.service "$pkgdir"/usr/lib/systemd/system/edge-ntopng@.service
  install -Dm644 packages/etc/systemd/system/supernode.service "$pkgdir"/usr/lib/systemd/system/supernode.service
}
