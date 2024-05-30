# @file PKGBUILD 
# @brief The package script
# @author Erick Carrillo.
# @copyright Copyright (C) 2023, Erick Alejandro Carrillo López, All right reserved.
# @license This project is released under the MIT License 

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: alecksandr <sansepiol26@gmail.com>

# Move to the build directory
pkgname=unittest-c
pkgver=1.3.3
pkgrel=10
epoch=
pkgdesc="unittest c is a fast and simple macro-based unit testing framework for C.
It's inspired by the Python unittest module and designed to reduce boilerplate code.
With macros and a built-in test runner, it's ideal for large test suites."
arch=('x86_64')
url="https://github.com/alecksandr26/unittest-c/archive/refs/tags/v1.1.2.tar.gz"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils except-c)
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
