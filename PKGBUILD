_pkgname=tsocks
pkgname=${_pkgname}-multilib
pkgver=1.8beta5
pkgrel=3
pkgdesc='Transparent SOCKS proxying library - multilib version'
arch=('x86_64')
url='http://tsocks.sourceforge.net/'
license=('GPL')
makedepends=('gcc-multilib')
provides=('tsocks')
conflicts=('tsocks')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b41636ea6b77abf0d1e3cda7bbca4e7ee96f3cdb1843f3a2c530650931e5567f67921de67b28ba9bab0f51df39770a3f7fb458cf7ac78aad7aa861923df2c4a9')

build() {
	export CPPFLAGS=

	cp -a "${srcdir}/${_pkgname}-1.8" "${srcdir}/${_pkgname}-1.8-64"
	cp -a "${srcdir}/${_pkgname}-1.8" "${srcdir}/${_pkgname}-1.8-32"

	cd "${srcdir}/${_pkgname}-1.8-64"
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/lib
	make

	cd "${srcdir}/${_pkgname}-1.8-32"
	CC='gcc -m32' ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/lib32
	make
}

package() {
	cd "${srcdir}/${_pkgname}-1.8-64"
	make DESTDIR="${pkgdir}" install

	cd "${srcdir}/${_pkgname}-1.8-32"
	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}/usr/share/${_pkgname}"
	install -m644 tsocks.conf.{simple,complex}.example "${pkgdir}/usr/share/${_pkgname}"

	# Fix up path so ld.so will find both the 64bit and the 32bit library
	sed -i -e 's|/usr/lib/||g' "${pkgdir}/usr/bin/tsocks"
}
