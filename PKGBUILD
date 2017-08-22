# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=arptables-git
pkgver=0.0.4.r15.gf4ab8f6
pkgrel=1
pkgdesc="ARP filtering utility"
arch=('i686' 'x86_64')
url="http://ebtables.netfilter.org/"
license=('GPL2')
depends=('glibc' 'perl')
makedepends=('git')
provides=('arptables')
conflicts=('arptables')
backup=("etc/arptables.conf")
source=("git://git.netfilter.org/arptables"
        "arptables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/arptables.service?h=packages/arptables"
        "arptables.systemd::https://git.archlinux.org/svntogit/packages.git/plain/trunk/arptables.systemd?h=packages/arptables")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "arptables"

  git describe --long --tags | sed 's/^arptables-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "arptables"

  make
}

package() {
  cd "arptables"

  make DESTDIR="$pkgdir" PREFIX="/usr" LIBDIR="/usr/lib/arptables" BINDIR="/usr/bin" MANDIR="/usr/share/man" \
    install

  rm -r "$pkgdir/etc/rc.d"

  install -Dm755 "$srcdir/arptables.systemd" \
    "$pkgdir/usr/lib/systemd/scripts/arptables"
  install -Dm644 "$srcdir/arptables.service" \
    "$pkgdir/usr/lib/systemd/system/arptables.service"

  install -Dm644 /dev/null "$pkgdir/etc/arptables.conf"
}
