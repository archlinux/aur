# Maintainer: András WACHA <awacha@gmail.com>
pkgname=ifeffit
pkgver=1.2.final
pkgrel=2
pkgdesc="XAFS analysis program"
arch=('i686' 'x86_64')
url="http://cars9.uchicago.edu/ifeffit/"
license=('GPL')
depends=('pgplot')
makedepends=('gcc-fortran')
source=("https://github.com/newville/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8708de3ea387cd0a47c7a1a4b5cf8e8e')


prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-pgplot=/usr/lib --with-pgplot-link="-lpgplot"
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mv "${pkgdir}/usr/share/ifeffit/libifeffit.so" "${pkgdir}/usr/lib/"
	mv "${pkgdir}/usr/bin/ifeffit" "${pkgdir}/usr/bin/ifeffit.bin"
	cat >"${pkgdir}/usr/bin/ifeffit" <<EOF
#!/bin/sh

PGPLOT_FONT=/usr/lib/grfont.dat /usr/bin/ifeffit.bin \$*
EOF
	chmod +x "${pkgdir}/usr/bin/ifeffit"
}
