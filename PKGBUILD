# Maintainer: Joey Pabalinas <alyptik@protonmail.com>
# Packager: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>

pkgname=intel2gas
pkgver=1.3.3
pkgrel=7
pkgdesc='Converts assembly language files between NASM and GNU assembler syntax'
arch=(x86_64)
depends=(gcc-libs)
license=(GPL)
source=("${pkgname}-${pkgver}.tar.gz"
	"${pkgname}_${pkgver}-16.diff.gz")

sha256sums=('8abb55437cb14c148e878cf40c8be8208ffbbe0e38d35a5e08c206f28b669538'
            'a515853868f4349c3c8bc348a973c77accb2e4fcb37dbd30f8b1dc50acc3baa7')

prepare() {
	cd "$srcdir/$pkgname-$pkgver" || return 1
	patch -Np1 < "../${pkgname}_${pkgver}-16.diff"
	sed '751,786 d' ./configure > ./configure.tmp
	mv ./configure.tmp ./configure
	chmod 0755 ./configure
}

build() {
	cd "$srcdir/$pkgname-$pkgver" || return 1
	./configure --prefix="/usr" --datadir="/usr/share/intel2gas"
	make CPP="g++ -E" CXXFLAGS+="-Wno-write-strings"
}

package() {
	cd "$srcdir/$pkgname-$pkgver" || return 1
	make install prefix="$pkgdir/usr"
	chmod 0644 "$pkgdir/usr/share/intel2gas/i2g/main.syntax"
}
