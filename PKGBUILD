# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ccleste
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="Celeste Classic C source port for 3DS and PC."
arch=('x86_64')
url="https://github.com/lemon-sherbet/ccleste"
license=('unknown')
groups=()
depends=('sdl_mixer')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("6cd4d4d42a4250b7e6222be1367eeecf58cdd63fa0bda62eb48e393bdc532eab")

prepare() {
	cd "$pkgname-$pkgver"

	# Change hardcoded flags
	sed -i Makefile \
		-e "s#CFLAGS=.*#CFLAGS=$CFLAGS $(pkg-config --cflags --libs SDL_mixer) -lm#" \
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
