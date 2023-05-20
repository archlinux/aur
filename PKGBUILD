# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ipset-git
pkgver=7.17.r10.g989d5a5
pkgrel=2
pkgdesc="Administration tool for IP sets"
arch=('i686' 'x86_64')
url="https://ipset.netfilter.org/"
license=('GPL2')
depends=('glibc' 'libmnl')
makedepends=('git')
provides=("ipset=$pkgver")
conflicts=('ipset')
backup=('etc/ipset.conf')
options=('staticlibs')
source=("git://git.netfilter.org/ipset"
        "ipset.service::https://gitlab.archlinux.org/archlinux/packaging/packages/ipset/-/raw/main/ipset.service")
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
