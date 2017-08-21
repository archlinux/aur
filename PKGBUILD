# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ebtables-git
pkgver=2.0.10.4.r12.g73c2371
pkgrel=1
pkgdesc="A filtering tool for a Linux-based bridging firewall"
arch=('i686' 'x86_64')
url="http://ebtables.netfilter.org/"
license=('GPL2')
depends=('glibc' 'perl' 'iptables')
makedepends=('git')
provides=('ebtables')
conflicts=('ebtables')
backup=("etc/$pkgname.conf")
source=("git://git.netfilter.org/ebtables"
        "ebtables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ebtables.service?h=packages/ebtables"
        "ebtables.systemd::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ebtables.systemd?h=packages/ebtables")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "ebtables"

  git describe --long --tags | sed 's/^ebtables-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ebtables"

  make
}

package() {
  cd "ebtables"

  make DESTDIR="$pkgdir" BINDIR="/usr/bin" MANDIR="/usr/share/man" \
    install

  rm -r "$pkgdir/etc"

  install -Dm755 "$srcdir/ebtables.systemd" \
    "$pkgdir/usr/lib/systemd/scripts/ebtables"
  install -Dm644 "$srcdir/ebtables.service" \
    "$pkgdir/usr/lib/systemd/system/ebtables.service"
  install -Dm644 "/dev/null" "$pkgdir/etc/ebtables.conf"
}
