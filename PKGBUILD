# Maintainer: éclairevoyant
# Contributor: Sara <sara at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pdftxt
pkgver=0.7
pkgrel=3
pkgdesc="A simple wrapper around mupdf library to extract text from pdf files."
arch=(i686 x86_64)
url="https://litcave.rudi.ir"
license=(BSD)
depends=(mupdf libmupdf sh)
makedepends=(mold)
install=$pkgname.install
source=("$url/$pkgname-$pkgver.tar.gz"
        mupdfgrep
        $pkgname.LICENSE)
b2sums=('c5b1fcc39211ab99e56b6eea6dca3fdbde5c6e40f98ba2c7376d1a763f112da622e65751810d31a0fcf5e6136d8106cda3b44b9b1075fe57a064ec54f00c07a2'
        '528ebbe0da721b941762d4064fef5224a3017962b518f9d29742529b76ce3048b6564a473227bbc017dd5c48fc1a7d0b388e9122dfd6e7fa2fc1511280112e9f'
        'd90aaff927755ed9d945cace1b6beeac21a63cd6792fb874144eeea29a7fa040b66fe89d39b250fab817eab3c05d6ca0492cf1765494a4749a32ef48549deefd')

prepare() {
	sed -i 's/-lmupdfthird/-lmupdf-third/;/FLAGS =/ s/=/+=/' $pkgname-$pkgver/Makefile
}

build() {
	export LDFLAGS+=" -lopenjp2 -lgumbo -lharfbuzz -lfreetype -lz -ljpeg -ljbig2dec"
	# does not link correctly with as-needed and ld
	mold -run make -C $pkgname-$pkgver
}

package() {
	install -Dm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 mupdfgrep -t "$pkgdir/usr/bin/"

	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}
