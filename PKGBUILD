# Maintainer:  Brian Bidulock <bidulock@openss7.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@mirantis.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=libpcap-symbols
_pkgname=libpcap
pkgver=1.9.0
pkgrel=1
pkgdesc='A system-independent interface for user-level packet capture (with symbols)'
arch=('x86_64' 'i686')
url='https://www.tcpdump.org/'
license=('BSD')
depends=('glibc' 'libnl' 'sh' 'libusbx' 'dbus')
makedepends=('flex' 'bluez-libs')
provides=("${_pkgname}=1.9.0")
conflicts=("${_pkgname}")
options=('!strip')
source=(https://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz
        mgmt.h)
sha256sums=('2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019'
            '7c85da5330ce7ecb6934795c02c652b9e344461302cf74804a4692c3e2e1e7e2')

prepare() {
  mkdir -p include/bluetooth
  cp mgmt.h include/bluetooth/
}

build() {
  cd $_pkgname-$pkgver
  CFLAGS="$CFLAGS -I${srcdir}/include $(pkg-config libnl-genl-3.0 --cflags)" \
  ./configure --prefix=/usr \
    --enable-ipv6 \
    --enable-bluetooth \
    --with-libnl
  make
}

package() {
  cd $_pkgname-$pkgver
  install -d -m755 "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # backwards compatibility, programs often look for net/bpf.h
  mkdir -p "$pkgdir/usr/include/net"
  cd "$pkgdir/usr/include/net"
  ln -s ../pcap-bpf.h bpf.h
}
