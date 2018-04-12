# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: sda <sda00@himki.net>

_pkgname=igmpproxy
pkgname=${_pkgname}-git
pkgver=r112.d755b5b
pkgrel=2
pkgdesc="a simple multicast router for Linux only using the IGMP protocol"
arch=(x86_64)
url="https://github.com/pali/igmpproxy"
license=('GPL')
depends=(glibc)
makedepends=(git)
provides=(igmpproxy)
conflicts=(igmpproxy)
backup=("etc/igmpproxy.conf")
source=("git+https://github.com/pali/igmpproxy"
	"igmpproxy.service")
sha256sums=('SKIP'
            '9f2eed64578b8bfb3091594cb32b3cd29798ba148d790286429cc6c86b8d423f')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/"$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir"/"$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
}
