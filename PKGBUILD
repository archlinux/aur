# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rp-pppoe-git
pkgver=4.0.r2.g5cd6616
pkgrel=1
pkgdesc="PPPoE client, relay and server for Linux"
arch=('i686' 'x86_64')
url="https://dianne.skoll.ca/projects/rp-pppoe/"
license=('GPL')
depends=('glibc' 'iproute2' 'ppp' 'sh')
makedepends=('git')
provides=("rp-pppoe=$pkgver")
conflicts=('rp-pppoe')
backup=('etc/ppp/firewall-masq'
        'etc/ppp/firewall-standalone'
        'etc/ppp/pppoe.conf'
        'etc/ppp/pppoe-server-options')
source=("git+https://github.com/dfskoll/rp-pppoe.git"
        "adsl.service::https://gitlab.archlinux.org/archlinux/packaging/packages/rp-pppoe/-/raw/main/adsl.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "rp-pppoe"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
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
