pkgname=sslh-git
pkgver=20100830
pkgrel=1
pkgdesc='SSL/SSH/OpenVPN/XMPP/tinc port multiplexer'
arch=('i686' 'x86_64')
url="http://www.rutschle.net/tech/sslh.shtml"
license=('GPL2')
depends=('libconfig')
backup=('etc/sslh.conf')
install=$pkgname.install
source=("$pkgname"::'git+https://github.com/yrutschle/sslh'
       'sslh-select.service'
       'sslh-fork.service')
md5sums=('SKIP'
         '67e8c9511508673254afa3e1ca61ff89'
         'a4402244a4d819beb3c6dc7ff031084e')
conflicts=('sslh')
provides=('sslh')
makedepends=('git')

build() {
  cd "$pkgname"
  make VERSION=\"v$pkgver\"
}

package() {
  cd "$pkgname"

  install -Dm 0755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm 0755 sslh-select "$pkgdir/usr/bin/sslh-select"
  ln -s sslh-fork "$pkgdir/usr/bin/sslh"
  # install manpage
  install -Dm 0644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"
  # install example file
  install -Dm 0644 example.cfg "$pkgdir/etc/sslh.conf"
  # systemd
  install -Dm 644 $srcdir/sslh-fork.service \
    "$pkgdir/usr/lib/systemd/system/sslh-fork.service"
  install -Dm 644 $srcdir/sslh-select.service \
    "$pkgdir/usr/lib/systemd/system/sslh-select.service"
}

# vim:set ts=2 sw=2 et:
