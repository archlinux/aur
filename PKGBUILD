# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=chocolate-quake
pkgver=1.0.0
pkgrel=1
pkgdesc="Conservative source port of Quake I"
# 32-bit build support might be possible? Ask upstream developer about this.
arch=('x86_64')
url="https://github.com/Henrique194/chocolate-quake"
license=('GPL-3.0-only')
depends=('sdl2' 'libvorbis' 'glibc')
makedepends=('gcc' 'cmake')
conflicts=('chocolate-quake-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Henrique194/chocolate-quake/archive/refs/tags/$pkgname-$pkgver.tar.gz"
			"$pkgname.desktop"
			"$pkgname.ico"
			"cflags.patch")
sha256sums=('487c37416a3351063348bc86951456451b7dba6dc74bd217063a5ff3ba8dad35'
						'cee69c7785c1579e16270ea77c98dc13862bda46870e824dcad9675281dbfcee'
						'aef5e540702d6f09eb685d16043f5b34c6c93f4bd5cd64b6a3435596eddb4867'
						'SKIP')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	patch < "$srcdir/cflags.patch"
}

build() {
	cd "$pkgname-$pkgname-$pkgver"
	[[ -d build ]] && rm -rf build
	mkdir build && cd build
	cmake ../ -D CMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	install -Dm755 build/src/chocolate-quake "$pkgdir/usr/bin/chocolate-quake"
	mkdir -p "$pkgdir/usr/share/doc/chocolate-quake/"
	mkdir -p "$pkgdir/usr/share/licenses/chocolate-quake/"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/chocolate-quake/changelog.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/chocolate-quake/readme.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chocolate-quake/LICENSE"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/chocolate-quake.desktop"
	install -Dm644 "$srcdir/$pkgname.ico" "$pkgdir/usr/share/pixmaps/chocolate-quake.ico"
}

post_install() {
	cat <<- EOF
		:: You need the Quake data (.pak) files to play.
		:: pak0.pak to play the shareware episode and/or
		:: additionally pak1.pak for the whole game.
	EOF
}

post_upgrade() {
	post_install $1
}
