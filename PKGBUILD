# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>

pkgname=networkmanager-openconnect-multiprotocol-git
pkgver=r805.e86c9b3
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenConnect - multiprotocol version"
url="https://github.com/dlenski/network-manager-openconnect"
arch=(i686 x86_64)
license=(GPL)
depends=(gcr libnm-glib libsecret openconnect-palo-git)
makedepends=(libnm-gtk intltool python git)
provides=(networkmanager-openconnect)
conflicts=(networkmanager-openconnect)
install=networkmanager-openconnect.install
source=("$pkgname::git+https://github.com/dlenski/network-manager-openconnect.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/NetworkManager --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
