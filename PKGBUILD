# Maintainer: András WACHA <awacha@gmail.com>
pkgname=ifeffit
pkgver=1.2.11c
pkgrel=1
pkgdesc="XAFS analysis program"
arch=('i686' 'x86_64')
url="https://millenia.cars.aps.anl.gov/ifeffit/"
license=('GPL')
depends=('pgplot')
makedepends=('gcc-fortran')
source=("https://master.dl.sourceforge.net/project/${pkgname}/${pkgname}/1.2.11/${pkgname}-1.2.11c.tar.gz")
md5sums=('f5654d2ef4908bf2aeb2eec27994f965')


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
