# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-tcp_wrappers-lib
pkgver=7.6
pkgrel=18
pkgdesc="Monitors and Controls incoming TCP connections - 32 bit libraries"
arch=(x86_64)
url="ftp://ftp.porcupine.org/pub/security/index.html"
license=('custom')
groups=('base')
depends=('lib32-glibc')
source=(ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${pkgver}.tar.gz
	http://archlinux-stuff.googlecode.com/files/tcp-wrappers-${pkgver}%2B.patch.gz)
sha256sums=('9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d'
	'875239e808030936c1dd576aba4dee6044496e8316bc32b2169468a2e9f471a1')

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
}

