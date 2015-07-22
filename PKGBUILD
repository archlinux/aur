# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: vigo <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=tcp_wrappers
pkgver=7.6
pkgrel=18
pkgdesc="Monitors and Controls incoming TCP connections"
arch=(i686 x86_64 armv5te armv6h armv6l armv7h armv7l)
url="ftp://ftp.porcupine.org/pub/security/index.html"
license=('custom')
groups=('base')
backup=(etc/hosts.allow etc/hosts.deny)
depends=('bash' 'glibc')
source=(ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${pkgver}.tar.gz
	http://archlinux-stuff.googlecode.com/files/tcp-wrappers-${pkgver}%2B.patch.gz
	hosts.allow
	hosts.deny)
md5sums=('e6fa25f71226d090f34de3f6b122fb5a'
         '3e786669e16b78ba726f948ddb73c9db'
         '32cfeeed797161034f62bb45f3167baa'
         'e4743ca604a1749c7312f9283b4bb0d1')

prepare() {
  cd $srcdir/${pkgname}_${pkgver}
  patch -p1 <$srcdir/tcp-wrappers-${pkgver}%2B.patch
  sed -i 's|usr/sbin|usr/bin|g' Makefile
}

build() {
  cd $srcdir/${pkgname}_${pkgver}
  make REAL_DAEMON_DIR=/usr/bin STYLE=-DPROCESS_OPTIONS linux
}

package() {
  cd $srcdir/${pkgname}_${pkgver}
  make REAL_DAEMON_DIR=/usr/bin DESTDIR=$pkgdir install
  install -D -m644 ../hosts.allow $pkgdir/etc/hosts.allow
  install -D -m644 ../hosts.deny $pkgdir/etc/hosts.deny
  install -D -m644 DISCLAIMER $pkgdir/usr/share/licenses/$pkgname/license.txt
}
