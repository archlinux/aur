# Maintainer: Chris Cromer <chris@cromer.cl>
# Contributor: artoo <artoo@manjaro.org>

pkgname=elogind
pkgver=219.14
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package for use on systems without systemd installed"
arch=('i686' 'x86_64')
url="https://github.com/wingo/elogind"
license=('GPL')
depends=('dbus' 'polkit' 'libudev.so')
makedepends=('libcap' 'intltool' 'libtool' 'gperf' 'gtk-doc')
options=('!libtool')
install=elogind.install
backup=('etc/elogind/logind.conf')
source=("https://wingolog.org/pub/elogind/$pkgname-$pkgver.tar.xz"
	'elogind-docs.patch'
	'elogind-lrt.patch')
sha256sums=('9dc150071a3f4c1ad1c989a7a143c2d41a2d571c643b92090e36a5d0396193c9'
            'cafea7a13159dee700902e3837aab015d9521dfe122840faf2d909b5dc02229e'
            'a9227ed4e97117ab5751de38c19813560a12f51379ccd882a89e7ef9842659ac')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	patch -Np 1 -i $srcdir/elogind-docs.patch
	patch -Np 1 -i $srcdir/elogind-lrt.patch
	sed -e "s|/bin/false|/usr/lib/elogind/elogind|" \
		-i src/login/org.freedesktop.login1.service
	autoreconf -vim
}

build() {
	cd $srcdir/${pkgname}-${pkgver}
	intltoolize
	./configure \
		--sysconfdir=/etc \
		--prefix=/usr \
		--libexecdir=/usr/lib

	make
}

package() {
	cd $srcdir/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
