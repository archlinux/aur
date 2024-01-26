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
pkgname=trycatch-c
pkgver=1.3.1
pkgrel=3
epoch=
pkgdesc="This module offers a straightforward macro interface that facilitates seamless exception handling in
 the C programming language, drawing inspiration from the paradigm employed in C++."
arch=(x86_64)
url="https://github.com/alecksandr26/trycatch-c/archive/refs/tags/v1.2.0.tar.gz"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils nasm)
optdepends=(valgrind)
source=("$pkgname-$pkgver.tar.gz::$url")
md5sums=('SKIP')
basedir=$(pwd)

# Compile the source code 
build () {
    if [ -f "$basedir/$pkgname-$pkgver.tar.gz" ]; then
	echo "[1m[32m==>[0m[1m Compiling package..."
        tar -xf "$basedir/$pkgname-$pkgver.tar.gz"
        cd "$srcdir/$pkgname-$pkgver"
        make compile
    else
        echo "[1m[32m==>[0m[1m Compiling package locally..."
	echo "[1m[32m==>[0m[1m Trying to find the local source code path..."
	if [ -d "../../../../$pkgname" ]; then
	    echo "[1m[32m==>[0m[1m Source code $pkgname found..."
	    cd ../../../../$pkgname
	    echo "[1m[32m==>[0m[1m Compiling package..."
	    make compile -B
	    mkdir -p $srcdir/$pkgname-$pkgver
	    mkdir -p $srcdir/$pkgname-$pkgver/include
	    mkdir -p $srcdir/$pkgname-$pkgver/lib
	    cp -r include/* $srcdir/$pkgname-$pkgver/include
	    cp -r lib/* $srcdir/$pkgname-$pkgver/lib
	else
	    echo "[1m[32m==>[0m[1m Error source code $pkgname not found..."
	    exit 1
	fi
    fi
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/usr/lib
    
    cp -r include/* $pkgdir/usr/include
    cp -r lib/* $pkgdir/usr/lib
}
