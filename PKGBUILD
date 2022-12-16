# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rp-pppoe-git
pkgver=r35.g3c9ac2b
pkgrel=1
pkgdesc="PPPoE client, relay and server for Linux"
arch=('i686' 'x86_64')
url="https://dianne.skoll.ca/projects/rp-pppoe/"
license=('GPL')
depends=('glibc' 'iproute2' 'ppp' 'sh')
makedepends=('git')
provides=("rp-pppoe=$pkgver")
conflicts=('rp-pppoe')
backup=(etc/ppp/firewall-masq
        etc/ppp/firewall-standalone
        etc/ppp/pppoe.conf
        etc/ppp/pppoe-server-options)
source=("git+https://github.com/dfskoll/rp-pppoe.git"
        "adsl.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/rp-pppoe/trunk/adsl.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "rp-pppoe"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "rp-pppoe/src"

  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --enable-plugin
  make \
    PLUGIN_DIR="/usr/lib/rp-pppoe" \
    all \
    rp-pppoe.so
}

package() {
  cd "rp-pppoe/src"

  make \
    DESTDIR="$pkgdir" \
    PLUGIN_DIR="/usr/lib/rp-pppoe" \
    install
  install -Dm644 "$srcdir/adsl.service" -t "$pkgdir/usr/lib/systemd/system"
}
