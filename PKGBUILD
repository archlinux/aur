# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ccleste
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="Celeste Classic C source port for 3DS and PC."
arch=('x86_64')
url="https://github.com/lemon-sherbet/ccleste"
license=('unknown')
groups=()
depends=('sdl2_mixer')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('32dfd797f3c863201e0c19aa97974c56a8ed589a34c0522503f25f6e1399edd6')

prepare() {
	cd "$pkgname-$pkgver"

	# Change hardcoded flags
	sed -i Makefile \
		-e "s#CFLAGS=.*#CFLAGS=$CFLAGS $(pkg-config --cflags --libs SDL2_mixer) -lm#" \
		-e "s#LDFLAGS=.*#LDFLAGS=$LDFLAGS#" \
		-e "/LDFLAGS\+=.*/d"

	# Change assets load path
	sed -i "s#data%c#/usr/share/$pkgname%c#" sdl12main.c
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share"

	install -D ccleste "$pkgdir/usr/bin/ccleste"
	mv data "$pkgdir/usr/share/$pkgname"
}
