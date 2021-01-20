# Maintainer: Sean Anderson <seanga2@gmail.com>
_srcname=RankCheck
pkgname=rankcheck
pkgver=1.5.2
pkgrel=3
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
	"https://github.com/Marukyu/$_srcname/releases/download/v$pkgver/$_srcname-v$pkgver-linux64.tar.gz"
	"https://sourceforge.net/projects/tinyfiledialogs/files/v3.4/tinyfiledialogs-3.4.3.zip")
md5sums=('655683def77850ac017557a355daf1fb'
         'd92ed245f0bfb7f87c2e4d23076e0c1f'
         'ea04d7a40a47d1aebc6b5ae31e56b3bf')

prepare() {
	cd "$_srcname-$pkgver"

	rmdir src/Shared/External/tinyfiledialogs/
	ln -s "$srcdir/tinyfiledialogs/" src/Shared/External/
	mkdir -p build
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
	install -m644 "$srcdir/$_srcname-v$pkgver/rankcheck.dat" "$pkgdir/opt/$pkgname/"
	
	install -d "${pkgdir}/usr/bin"
	cat > "$pkgdir/usr/bin/$_srcname" <<- EOF
		#!/bin/bash

		cd /opt/$pkgname/
		./$_srcname \$\@
	EOF
	chmod 755 "$pkgdir/usr/bin/$_srcname"
}
