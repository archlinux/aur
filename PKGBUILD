# Maintainer: mortzu <me@mortzu.de>
# Contributor: David Manouchehri <d@32t.ca>
# Submitter: fluffylime <fluffylime@gmail.com>

pkgname=redsocks-git
pkgver=0.1.r43.g2e3f648
pkgrel=1
pkgdesc='Transparent redirector of any TCP connection to proxy using your firewall'
arch=('i686' 'x86_64')
url='http://darkk.net.ru/redsocks/'
license=('GPL3')
depends=('libevent')
makedepends=('git')
conflicts=('redsocks')
provides=('redsocks')
install=redsocks.install
backup=('etc/redsocks.conf'
        'etc/conf.d/redsocks'
        'etc/iptables/redsocks.rules')

source=("$pkgname"::'git+https://github.com/darkk/redsocks.git'
        'redsocks.conf'
        'redsocks.tmpfiles'
        'redsocks.rules')
md5sums=('SKIP'
         'ed8b0090ded9de0940b1cd7539c78422'
         '9be5e8bea768b1a8fdec55a8e8af33fd'
         '04702a7faf31d707d3df4c116bd58a6d')

pkgver() {
  cd "$pkgname"

  git describe | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  install -Dm644 "$srcdir/redsocks.conf" "$pkgdir/etc/redsocks.conf"
  install -Dm644 "$srcdir/redsocks.rules" "$pkgdir/etc/iptables/redsocks.rules"
  install -Dm644 "$srcdir/redsocks.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/redsocks.conf"

  install -Dm755 "redsocks" "$pkgdir/usr/bin/redsocks"
  install -Dm644 "README" "$pkgdir/usr/share/doc/redsocks/README"
  install -Dm644 "redsocks.service" "$pkgdir/usr/lib/systemd/system/redsocks.service"
  install -Dm644 "redsocks.conf.example" "$pkgdir/usr/share/doc/redsocks/redsocks.conf.example"
}
