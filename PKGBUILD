# Maintainer: Sean Anderson <seanga2@gmail.com>
_srcname=RankCheck
pkgname=rankcheck
pkgver=1.5.1
pkgrel=1
epoch=
pkgdesc="A tool for Awesomenauts which automatically fetches and displays the leaderboard ranks of each player in the current match"
arch=('i686' 'x86_64')
url="https://rankcheck.marukyu.de/"
license=('MIT')
depends=(
	'sfml'
	'poco'
	'glu'
	'zlib'
)
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
backup=()
options=()
source=("https://github.com/Marukyu/$_srcname/archive/v$pkgver.tar.gz"
	"https://rankcheck.marukyu.de/files/rankcheck.dat")
md5sums=('ac3175e8728baa5560298dd8e995943c'
         '5946964d98fa7c349acfc5f5c1b43f2b')

prepare() {
	cd "$_srcname-$pkgver"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build
}

build() {
	cd "$_srcname-$pkgver/build"

	cmake ..
	make
}

package() {
	cd "$_srcname-$pkgver/build"

	# The binary expects rankcheck.json to be in the same directory, so stick stuff in opt until it gets fixed upstream
	install -dm755 "$pkgdir/opt/$pkgname"
	install -m755 "bin/$_srcname" "$pkgdir/opt/$pkgname/"
	install -m644 "bin/rankcheck.json" "$pkgdir/opt/$pkgname/"
	install -m644 "$srcdir/rankcheck.dat" "$pkgdir/opt/$pkgname/"
	
	install -d "${pkgdir}/usr/bin"
	cat > "$pkgdir/usr/bin/$_srcname" <<- EOF
		#!/bin/bash

		cd /opt/$pkgname/
		./$_srcname \$\@
	EOF
	chmod 755 "$pkgdir/usr/bin/$_srcname"
}
