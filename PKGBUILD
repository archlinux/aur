# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Colin Shea <colin@shea.at>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-tcp_wrappers
pkgver=7.6
pkgrel=18
pkgdesc="Monitors and Controls incoming TCP connections - 32 bit libraries"
arch=(x86_64)
url="ftp://ftp.porcupine.org/pub/security/index.html"
license=('custom')
groups=('base')
depends=('bash' 'lib32-glibc' 'tcp_wrappers')
source=(ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${pkgver}.tar.gz
	http://archlinux-stuff.googlecode.com/files/tcp-wrappers-${pkgver}%2B.patch.gz)
md5sums=('e6fa25f71226d090f34de3f6b122fb5a'
         '3e786669e16b78ba726f948ddb73c9db')

prepare() {
  cd $srcdir/tcp_wrappers_${pkgver}
  sed -i 's/CC\t= gcc/CC\t= gcc -m32/' $srcdir/tcp-wrappers-${pkgver}%2B.patch
  patch -p1 <$srcdir/tcp-wrappers-${pkgver}%2B.patch
  sed -i 's|usr/lib|usr/lib32|g' Makefile
  sed -i 's|usr/sbin|usr/bin|g' Makefile
}

build() {
  cd $srcdir/tcp_wrappers_${pkgver}
  make CC='gcc -m32' REAL_DAEMON_DIR=/usr/bin STYLE=-DPROCESS_OPTIONS linux
}

package() {
  cd $srcdir/tcp_wrappers_${pkgver}
  make REAL_DAEMON_DIR=/usr/bin DESTDIR=$pkgdir install-lib
  install -D -m644 DISCLAIMER $pkgdir/usr/share/licenses/$pkgname/license.txt
}
