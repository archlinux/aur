# Maintainer: Issam Maghni <me at concati dot me>

pkgname=bearssl
pkgver=0.6
pkgrel=1
pkgdesc='Implementation of the SSL/TLS protocol (RFC 5246) written in C'
arch=('x86_64')
url='https://bearssl.org'
depends=('glibc')
license=('MIT')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('6705bba1714961b41a728dfc5debbe348d2966c117649392f8c8139efc83ff14')

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS="$CFLAGS -fpic" LDFLAGS="$LDFLAGS" D=.so.$pkgver \
		LDDLLFLAGS="$LDFLAGS -shared -Wl,-soname,lib$pkgname.so.${pkgver%%.*}"
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgname-$pkgver/build"
	mv ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
	mv ../inc "$pkgdir/usr/include"
	mv brssl "$pkgdir/usr/bin"
	mv  "lib$pkgname.so.$pkgver" "lib$pkgname.a" "$pkgdir/usr/lib"
	ln -s "lib$pkgname.so.$pkgver" "$pkgdir/usr/lib/lib$pkgname.so.${pkgver%%.*}"
	ln -s "lib$pkgname.so.${pkgver%%.*}" "$pkgdir/usr/lib/lib$pkgname.so"
}
