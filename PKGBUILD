# Maintainer: gilcu3 <gilcu3 [at] gmail [dot] com>
# Contributor: mortzu <me@mortzu.de>
# Contributor: David Manouchehri <d@32t.ca>
# Submitter: fluffylime <fluffylime@gmail.com>

_pkgname=redsocks
pkgname=${_pkgname}2-git
pkgver=0.67.r36.g1951b49
pkgrel=2
pkgdesc='redsocks2'
arch=('i686' 'x86_64')
url='https://github.com/semigodking/redsocks'
license=('GPL3')
depends=('libevent')
makedepends=('git')
conflicts=('redsocks')
provides=('redsocks2')
install=redsocks2.install
backup=('etc/redsocks2.conf'
        'etc/iptables/redsocks2.rules'
	'etc/redsocks2.conf')
source=("git+$url.git"
        'redsocks2.tmpfiles'
        'redsocks2.rules')
md5sums=('SKIP'
         '786503490bd6acb33f526e22078fdc87'
         '04702a7faf31d707d3df4c116bd58a6d')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/release.//g'
}

build() {
  cd "$_pkgname"

  make DISABLE_SHADOWSOCKS=true
}

package() {
  cd "$_pkgname"

  install -Dm644 "$srcdir/$_pkgname/redsocks.conf.example" "$pkgdir/etc/redsocks2.conf"
  install -Dm644 "$srcdir/redsocks2.rules" "$pkgdir/etc/iptables/redsocks2.rules"
  install -Dm644 "$srcdir/redsocks2.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/redsocks2.conf"

  install -Dm755 "redsocks2" "$pkgdir/usr/bin/redsocks2"
  install -Dm644 "README" "$pkgdir/usr/share/doc/redsocks2/README"
  install -Dm644 "redsocks2.service" "$pkgdir/usr/lib/systemd/system/redsocks2.service"
  install -Dm644 "redsocks.conf.example" "$pkgdir/usr/share/doc/redsocks2/redsocks2.conf.example"
}
