# Maintainer: aksr <aksr at t-com dot me>
pkgname=nawk-git
pkgver=20231001.r288.d8e4368
pkgrel=1
pkgdesc='The version of awk described in "The AWK Programming Language".'
arch=('i686' 'x86_64')
url='https://github.com/onetrueawk/awk'
license=('MIT')
depends=(glibc)
makedepends=(git)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!makeflags')
source=("$pkgname::git+$url"
        "${pkgname}-bsd::git+$url#branch=bsd-features")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" "$(grep '*version' main.c | sed 's/.*version //;s/";//')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/^\.TH AWK/.TH NAWK/;s/awk/nawk/g;s/Awk/Nawk/' awk.1
	sed -i '/^\.CT .*/d;/^\.TF .*/d' awk.1
	cd "$srcdir/$pkgname-bsd"
	sed -i 's/^\.TH AWK/.TH NAWK-BSD/;s/awk/nawk-bsd/g;s/Awk/Nawk-BSD/' awk.1
	sed -i '/^\.CT .*/d;/^\.TF .*/d' awk.1
}

build() {
	cd "$srcdir/$pkgname"
	make "CPPFLAGS=-DHAS_ISBLANK $CPPFLAGS" "LDFLAGS=$LDFLAGS" "CFLAGS=$CFLAGS"
	cd "$srcdir/$pkgname-bsd"
	make "CPPFLAGS=-DHAS_ISBLANK $CPPFLAGS" "LDFLAGS=$LDFLAGS" "CFLAGS=$CFLAGS"
}

check() {
	cd "$srcdir/$pkgname"
	./REGRESS
	cd "$srcdir/$pkgname-bsd"
	./REGRESS
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 a.out "$pkgdir/usr/bin/nawk"
	install -Dm644 awk.1 "$pkgdir/usr/share/man/man1/nawk.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nawk/LICENSE"
	cd "$srcdir/$pkgname-bsd"
	install -Dm755 a.out "$pkgdir/usr/bin/nawk-bsd"
	install -Dm644 awk.1 "$pkgdir/usr/share/man/man1/nawk-bsd.1"
}

