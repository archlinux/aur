# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ipset-git
pkgver=6.32.r6.g8fc8ad1
pkgrel=1
pkgdesc="Administration tool for IP sets"
arch=('i686' 'x86_64')
url="http://ipset.netfilter.org/"
license=('GPL2')
depends=('glibc' 'libmnl')
makedepends=('git')
provides=('ipset')
conflicts=('ipset')
backup=("etc/ipset.conf")
options=('staticlibs')
source=("git://git.netfilter.org/ipset"
        "ipset.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ipset.service?h=packages/ipset")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "ipset"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ipset"

  ./autogen.sh
  ./configure --prefix="/usr" --sbindir="/usr/bin" --with-kmod=no
  make
}

package() {
  cd "ipset"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/ipset.service" "$pkgdir/usr/lib/systemd/system/ipset.service"
  install -Dm644 /dev/null "$pkgdir/etc/ipset.conf"
}
