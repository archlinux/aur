# Maintainer: Wade Duvall <wsduvall@proton.me>
# Contributor: Daniel <dgcbueu@gmail.com>

pkgname=netdiscover
pkgver=0.21
pkgrel=0
pkgdesc="A network address discovering tool"
arch=('i686' 'x86_64')
url="https://github.com/netdiscover-scanner/netdiscover/"
license=('GPL-3.0-only')
depends=('libnet' 'libpcap')
makedepends=('gcc' 'make')
provides=('netdiscover')
source=("https://github.com/netdiscover-scanner/netdiscover/releases/download/${pkgver}/netdiscover-${pkgver}.tar.gz"
  "oui-${pkgver}.txt::http://standards-oui.ieee.org/oui/oui.txt")

sha256sums=('c268605f609c2037cc6f405d7275ba26f1e6a6e180084afcb4b659cfded44435'
  'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cat <<EOT >src/oui.h
struct oui {
   char *prefix;   /* 24 bit global prefix */
   char *vendor;   /* Vendor id string     */
};

struct oui oui_table[] = {
EOT

  grep "base 16" "${srcdir}/oui-${pkgver}.txt" | tr '\t' ' ' | tr -s " " | sed 's/(base 16) //' |
    grep '[0-9A-F]' | sort | sed 's/ /", "/' | sed 's/^/    { "/' |
    tr '\n' '#' | sed 's/#/" },#/g' | tr '#' '\n' | tr -d '\015' >>src/oui.h

  TOTALMAC=$(grep -c "{ .[0-9A-F]" src/oui.h)

  # The tail

  cat <<EOT >>src/oui.h
    { NULL, NULL }
};

// Total $TOTALMAC items.
EOT
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --sbindir=/usr/bin --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
}
