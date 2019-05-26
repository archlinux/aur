# Maintainer: Matthew Barichello <matthewjbarichello@gmail.com>

_pkgname=sslh
pkgname=$_pkgname-systemd-git
pkgver=1.20
pkgrel=1
pkgdesc="Network port multiplexer. Allows sharing of HTTP, SSL, SSH, OpenVPN, tinc, XMPP, etc. on the same port"
arch=('i686' 'x86_64')
url='http://www.rutschle.net/tech/sslh.shtml'
license=('GPL2')
depends=('libcap' 'libconfig' 'libwrap' 'systemd')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/sslh/sslh.cfg')
source=($pkgname::'git+https://github.com/matthewacon/sslh'
        'sslh.cfg'
        'sslh.sysusers'
        'sslh@.service'
        'sslh-select@.service')
md5sums=('SKIP'
         'd5405c7ca7e1813e4d49a473e5834640'
         'f39544277a30595d4b7476b3f87ebbcf'
         '97b214f91f02e42269cb858dfc51bef2'
         '75a0056c919dc644910c4b36d7bd9e6f')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make -j`nproc` all USELIBWRAP=true USELIBCONFIG=true USESYSTEMD=true 
}

package() {
  # Default config
  install -Dm644 sslh.cfg "$pkgdir/etc/sslh/sslh.cfg"

  # Systemd
  install -Dm644 sslh.sysusers "$pkgdir/usr/lib/sysusers.d/sslh.conf"
  install -Dm644 sslh@.service "$pkgdir/usr/lib/systemd/system/sslh@.service"
  install -Dm644 sslh-select@.service "$pkgdir/usr/lib/systemd/system/sslh-select@.service"

  cd $pkgname
  install -Dm644 scripts/etc.sysconfig.sslh "$pkgdir/etc/conf.d/sslh"

  # Executables
  install -Dm755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm755 sslh-select "$pkgdir/usr/bin/sslh-select"
  ln -s sslh-fork "$pkgdir/usr/bin/sslh"
  install -Dm755 systemd-sslh-generator "$pkgdir/usr/lib/systemd/system-generators/systemd-sslh-generator" 

  # Manpage
  install -Dm644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"

  # Examples
  install -Dm644 basic.cfg "$pkgdir/usr/share/doc/$_pkgname/basic.cfg"
  install -Dm644 example.cfg "$pkgdir/usr/share/doc/$_pkgname/example.cfg"
 }
