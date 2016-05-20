# Maintainer: Chris Cromer <chris@cromer.cl>
# Contributor: artoo <artoo@manjaro.org>

pkgname=elogind-git
_pkgname=elogind
pkgver=219.14.6d224ff
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('i686' 'x86_64')
url="https://github.com/wingo/elogind.git"
license=('GPL')
depends=('dbus' 'polkit' 'libudev.so')
makedepends=('git' 'libcap' 'intltool' 'libtool' 'gperf' 'gtk-doc')
provides=('elogind')
conflicts=('elogind')
options=('!libtool')
install=elogind.install
backup=('etc/elogind/logind.conf')
source=("git+${url}"
	'elogind-docs.patch'
	'elogind-lrt.patch')
sha256sums=(SKIP
            'cafea7a13159dee700902e3837aab015d9521dfe122840faf2d909b5dc02229e'
            'a9227ed4e97117ab5751de38c19813560a12f51379ccd882a89e7ef9842659ac')

prepare() {
	cd $srcdir/$_pkgname
	patch -Np 1 -i $srcdir/elogind-docs.patch
	patch -Np 1 -i $srcdir/elogind-lrt.patch
	sed -e "s|/bin/false|/usr/lib/elogind/elogind|" \
		-i src/login/org.freedesktop.login1.service
	autoreconf -vim
}

build() {
	cd $srcdir/${_pkgname}
	intltoolize
	./configure \
		--sysconfdir=/etc \
		--prefix=/usr \
		--libexecdir=/usr/lib

	make
}

package() {
	cd $srcdir/${_pkgname}
	make DESTDIR="${pkgdir}" install
}
