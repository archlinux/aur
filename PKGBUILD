# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ipset-git
pkgver=7.11.r10.g578462f
pkgrel=1
pkgdesc="Administration tool for IP sets"
arch=('i686' 'x86_64')
url="https://ipset.netfilter.org/"
license=('GPL2')
depends=('glibc' 'libmnl')
makedepends=('git')
provides=('ipset')
conflicts=('ipset')
backup=('etc/ipset.conf')
options=('staticlibs')
source=("git://git.netfilter.org/ipset"
        "ipset.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ipset/trunk/ipset.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "ipset"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ipset"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --with-kmod=no
  make
}

package() {
  cd "ipset"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/ipset.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 /dev/null "$pkgdir/etc/ipset.conf"
  install -Dm644 "utils/ipset_bash_completion/ipset" -t "$pkgdir/usr/share/bash-completion/completions"
}
