# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=chocolate-quake
pkgver=1.1.0
pkgrel=1
pkgdesc="Conservative source port of Quake I"
#32-bit support do be experimental, if it doesn't work, I'll just keep it at x64.
arch=('x86_64' 'arm64' 'i686')
url="https://github.com/Henrique194/chocolate-quake"
license=('GPL-3.0-only')
depends=('sdl2')
makedepends=('cmake' 'gcc' 'git')
conflicts=('chocolate-quake-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Henrique194/chocolate-quake/archive/refs/tags/$pkgname-$pkgver.tar.gz"
	"$pkgname.desktop"
	"$pkgname.ico"
	"cmake.patch")
sha256sums=('3be58436be7ff99e3f5171bc387ee87a0641ef4db213fcacd33f650f94e651ab'
	'cee69c7785c1579e16270ea77c98dc13862bda46870e824dcad9675281dbfcee'
	'aef5e540702d6f09eb685d16043f5b34c6c93f4bd5cd64b6a3435596eddb4867'
	'SKIP')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	patch < "$srcdir/cmake.patch"
}

build() {
	cd "$pkgname-$pkgname-$pkgver/"
	rm -rf cmake-build-release/
	cd external
	rm -rf vcpkg/
	git clone https://github.com/microsoft/vcpkg.git
	cd ..
	local cmake_options=(
	-Wno-dev
	--preset release
	-DCMAKE_MAKE_PROGRAM=ninja
	-DCMAKE_C_COMPILER=gcc
	-DCMAKE_FLAGS=Wno-format-security
	)
	cmake "${cmake_options[@]}"
	cmake --build --preset release
}

package() {
	cd "$pkgname-$pkgname-$pkgver/"
	install -Dm755 cmake-build-release/src/Release/chocolate-quake "$pkgdir/usr/bin/chocolate-quake"
	mkdir -p "$pkgdir/usr/share/doc/chocolate-quake/"
	mkdir -p "$pkgdir/usr/share/licenses/chocolate-quake/"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/chocolate-quake/changelog.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/chocolate-quake/readme.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chocolate-quake/LICENSE"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/chocolate-quake.desktop"
	install -Dm644 "$srcdir/$pkgname.ico" "$pkgdir/usr/share/pixmaps/chocolate-quake.ico"
}

post_upgrade() {
	cat <<- EOF
		:: You need the Quake data (.pak) files to play.
		:: pak0.pak to play the shareware episode and/or
		:: additionally pak1.pak for the whole game.
	EOF
}
