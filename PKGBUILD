# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ebtables-git
pkgver=2.0.11.r15.g87328a7
pkgrel=1
pkgdesc="A filtering tool for a Linux-based bridging firewall"
arch=('i686' 'x86_64')
url="https://ebtables.netfilter.org/"
license=('GPL-2.0-or-later')
depends=('glibc' 'perl' 'iptables')
makedepends=('git')
provides=("ebtables=$pkgver")
conflicts=('ebtables')
backup=('etc/ebtables.conf')
source=("git+https://git.netfilter.org/ebtables"
        "ebtables.service::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/ebtables.service")
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
