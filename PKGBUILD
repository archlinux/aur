# Maintainer: willemw <willemw12@gmail.com>

_pkgname=sslh
pkgname=$_pkgname-git
pkgver=1.18.r13.g718fe0e
pkgrel=1
pkgdesc="Network port multiplexer. Allows sharing of HTTP, SSL, SSH, OpenVPN, tinc, XMPP, etc. on the same port"
arch=('i686' 'x86_64')
url='http://www.rutschle.net/tech/sslh.shtml'
license=('GPL2')
depends=('libcap' 'libconfig' 'libwrap' 'systemd')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/sslh.conf')
source=($pkgname::'git+https://github.com/yrutschle/sslh'
        'sslh.conf'
        'sslh.sysusers')
md5sums=('SKIP'
         'd5405c7ca7e1813e4d49a473e5834640'
         'f39544277a30595d4b7476b3f87ebbcf')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|^\(ExecStart.*\) $DAEMON_OPTS|\1 -F/etc/sslh.conf|' scripts/systemd.sslh.service
}

build() {
  cd $pkgname
  make
}

package() {
  # Default config
  install -Dm644 sslh.conf "$pkgdir/etc/sslh.conf"

  # Systemd
  install -Dm644 sslh.sysusers "$pkgdir/usr/lib/sysusers.d/sslh.conf"

  cd $pkgname
  install -Dm644 scripts/etc.sysconfig.sslh "$pkgdir/etc/conf.d/sslh"
  install -Dm644 scripts/systemd.sslh.service "$pkgdir/usr/lib/systemd/system/sslh.service"

  # Executables
  install -Dm755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm755 sslh-select "$pkgdir/usr/bin/sslh-select"
  ln -s sslh-fork "$pkgdir/usr/bin/sslh"

  # Manpage
  install -Dm644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"

  # Examples
  install -Dm644 basic.cfg "$pkgdir/usr/share/doc/$pkgname/basic.cfg"
  install -Dm644 example.cfg "$pkgdir/usr/share/doc/$pkgname/example.cfg"
}

