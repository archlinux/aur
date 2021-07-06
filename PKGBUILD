# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ebtables-git
pkgver=2.0.11.r4.g52f88f8
pkgrel=1
pkgdesc="A filtering tool for a Linux-based bridging firewall"
arch=('i686' 'x86_64')
url="https://ebtables.netfilter.org/"
license=('GPL2')
depends=('glibc' 'perl' 'iptables')
makedepends=('git')
provides=('ebtables')
conflicts=('ebtables')
backup=('etc/ebtables.conf')
source=("git://git.netfilter.org/ebtables"
        "ebtables.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/master/iptables/trunk/ebtables.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "ebtables"

  git describe --long --tags | sed 's/^ebtables-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ebtables"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

package() {
  cd "ebtables"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/ebtables.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "/dev/null" "$pkgdir/etc/ebtables.conf"
}
