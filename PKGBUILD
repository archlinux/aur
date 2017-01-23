# Maintainer: Sergey Vanyushin <wapmorgan@gmail.com>
pkgname=cam
pkgver=1.0.1
pkgrel=1
pkgdesc="Unified console archive manager for zip/rar/7z/tar/iso/gz/bz2/xz."
arch=('any')
url="https://github.com/wapmorgan/CAM"
license=('MIT')
groups=()
depends=('php')
optdepends=('php-rar: Working with rar archives'
	    'php-bzip2: Working with .bz2 archives'
	    'php-lzma2: Working with .xz archives'
	    'p7zip: Working with .7z archives')
makedepends=('composer')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('binary.patch')
noextract=()
md5sums=('4dcb9f1f8545826d7135202a36dbf300')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
	mkdir $srcdir/$pkgname-$pkgver.$pkgrel
	cd $srcdir/$pkgname-$pkgver.$pkgrel
	composer create-project --quiet --prefer-dist --no-dev --no-install wapmorgan/${pkgname} . ${pkgver}
	patch -p1 -i "$srcdir/binary.patch"
}

build() {
	cd $srcdir/$pkgname-$pkgver.$pkgrel
	composer update --quiet --no-autoloader --prefer-dist
	composer require --quiet --prefer-dist --optimize-autoloader gemorroj/archive7z pear/archive_tar pear/archive_tar phpclasses/php-iso-file
}

package() {
	mkdir -p $pkgdir/usr
	mv $srcdir/$pkgname-$pkgver.$pkgrel/bin $pkgdir/usr/
	mkdir -p $pkgdir/usr/lib/cam
	mv $srcdir/$pkgname-$pkgver.$pkgrel/* $pkgdir/usr/lib/cam/
}
