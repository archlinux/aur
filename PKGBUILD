# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: alecksandr <sansepiol26@gmail.com>
pkgname=assert-fortran-git
pkgver=1.1.1
pkgrel=2
epoch=
pkgdesc="This is an assertion module for fortran, easy to use"
arch=(x86_64)
url="https://github.com/alecksandr26/assert-fortran-git/archive/refs/tags/v1.1.1.tar.gz"
license=('MIT license')
depends=()
makedepends=(gcc-fortran make binutils coreutils)
optdepends=(valgrind)
source=("$pkgname-$pkgver.tar.gz::$url")
md5sums=('SKIP')
basedir=$(pwd)

# Compile the source code 
build() {
    if [ -f "$basedir/$pkgname-$pkgver.tar.gz" ]; then
	echo "==> Compiling package..."
        tar -xf "$basedir/$pkgname-$pkgver.tar.gz"
        cd "$srcdir/$pkgname-$pkgver"
        make compile
    else
        echo "==> Compiling package locally..."
	echo "==> Trying to find the locall source code path..."
	if [ -d "../../../../$pkgname" ]; then
	    echo "==> Source code $pkgname found..."
	    cd ../../../../$pkgname
	    make compile
	    mkdir -p $srcdir/$pkgname-$pkgver
	    mkdir -p $srcdir/$pkgname-$pkgver/include
	    mkdir -p $srcdir/$pkgname-$pkgver/lib
	    cp -r include/* $srcdir/$pkgname-$pkgver/include
	    cp -r lib/* $srcdir/$pkgname-$pkgver/lib
	else
	    echo "==> Error source code $pkgname not found..."
	    exit 1
	fi
    fi
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $srcdir/$pkgname-$pkgver
    
    # Create the folders
    mkdir -p $pkgdir/usr
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/usr/lib
    
    # Install into the package the program
    cp -r include/* $pkgdir/usr/include
    cp -r lib/* $pkgdir/usr/lib
}
