# Maintainer: Cody P Schafer <dev@codyps.com>
# Maintainer: Michał Wojdyła <micwoj9292@gmail.com>
# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
pkgname=hfsutils
pkgver=3.2.6_p16
pkgrel=4
pkgdesc="Tools for reading and writing Macintosh volumes"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://www.mars.org/home/rob/proj/hfs/"
depends=(glibc sh tcl tk)
source=(
	"https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver/_p*}.orig.tar.gz"
	"https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver/_p/-}.debian.tar.xz"
	)
sha256sums=('bc9d22d6d252b920ec9cdf18e00b7655a6189b3f34f42e58d5bb152957289840'
            'fa128b4701b02d5698fc4bbb393ad1a8a54fdd9a33ffad3fdc1f10fd0ad11a89')

prepare() {
	for file in $(cat ./debian/patches/series); do
		patch -Np1 -d ${pkgname}-${pkgver%_p*} <"debian/patches/$file"
	done

	cd "${pkgname}-${pkgver%_p*}"
	autoreconf -fi
}

build() {
	cd "${pkgname}-${pkgver%_p*}"
	CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types"
	./configure --with-tcl --with-tk
	make
	make -C hfsck
}

package() {
	cd "${pkgname}-${pkgver%_p*}"
	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/man/man1"
	DESTDIR="${pkgdir}" make install prefix="${pkgdir}/usr" MANDEST="${pkgdir}/usr/share/man"
}
