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
pkgname=stl-c
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="stl-c is a C library designed to provide a set of structure-related functionalities for working with
static memory and dynamic memory. Inspired by the Standard Template Library (STL) of C++"

arch=('x86_64')
url="https://github.com/alecksandr26/stl-c/archive/refs/tags/v1.0.0.tar.gz"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils trycatch-c)
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
