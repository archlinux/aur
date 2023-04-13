# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=whois-git
pkgver=5.5.16.r0.g41b3435
pkgrel=1
pkgdesc="The whois client by Marco d'Itri"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL2')
depends=('glibc' 'libidn2' 'libxcrypt')
makedepends=('git' 'perl')
provides=("whois=$pkgver")
conflicts=('whois')
backup=('etc/whois.conf')
source=("git+https://github.com/rfc1036/whois.git#branch=next")
sha256sums=('SKIP')


pkgver() {
  cd "whois"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "whois"

  make \
    CFLAGS="$CFLAGS $CPPFLAGS" \
    prefix="/usr" \
    CONFIG_FILE="/etc/whois.conf" \
    LOCALEDIR=1 \
    HAVE_ICONV=1
}

package() {
  cd "whois"

  make \
    BASEDIR="$pkgdir" \
    prefix="/usr" \
    install-whois \
    install-pos
  install -Dm644 "whois.conf" -t "$pkgdir/etc"
}
