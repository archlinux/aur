# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Aidan MP <admin@bitshift.net.au>
_pkgname=spidriver
pkgname=$_pkgname-git
pkgver=v$pkgver.r43.gc781cc2
pkgrel=1
pkgdesc="CL utility and shared library, for the spidriver usb-to-spi adaptor"
arch=('i686' 'x86_64')
url="https://spidriver.com/"
license=('BSD')
makedepends=('git')
provides=("spidriver.so_$pkgver" "spicl")
source=('spidriver-git::git+https://github.com/jamesbowman/spidriver.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/.*r/v$pkgver.r/'
}

build() {
	cd $srcdir/$pkgname/c 
    make -f linux/Makefile
    cd common
    gcc -c -Wall -Werror -fpic spidriver.c
    gcc -shared -o libspidriver.so spidriver.o
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib

	cd $srcdir/$pkgname/c
    cp ./build/spicl $pkgdir/usr/bin
    cp ./common/libspidriver.so $pkgdir/usr/lib
}
