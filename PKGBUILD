# Maintainer: Issam Maghni <me at concati dot me>

pkgname=bearssl
pkgver=0.6
pkgrel=2
pkgdesc='Implementation of the SSL/TLS protocol (RFC 5246) written in C'
arch=('x86_64')
url='https://bearssl.org'
depends=('glibc')
license=('MIT')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('6705bba1714961b41a728dfc5debbe348d2966c117649392f8c8139efc83ff14')

build() {
	make -C"$pkgname-$pkgver" CFLAGS="$CFLAGS -fpic" LDFLAGS="$LDFLAGS" D=".so.$pkgver" \
		LDDLLFLAGS="$LDFLAGS -shared -Wl,-soname,lib$pkgname.so.${pkgver%%.*}"
}

check() {
	cd "$pkgname-$pkgver/build"
	./testcrypto all
	./testx509
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/include/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgname-$pkgver/build"
	sed -e 's|"bearssl_|"bearssl/|g' -i ../inc/*
	for h in ../inc/bearssl_*
	do  mv $h "$pkgdir/usr/include/bearssl/${h#*_}"
	done
	mv ../inc/bearssl.h "$pkgdir/usr/include"
	mv ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
	mv brssl "$pkgdir/usr/bin"
	mv  "lib$pkgname.so.$pkgver" "lib$pkgname.a" "$pkgdir/usr/lib"
	ln -s "lib$pkgname.so.$pkgver" "$pkgdir/usr/lib/lib$pkgname.so.${pkgver%%.*}"
	ln -s "lib$pkgname.so.${pkgver%%.*}" "$pkgdir/usr/lib/lib$pkgname.so"
}
