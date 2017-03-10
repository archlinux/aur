# Maintainer: Pierre Choffet <peuc@wanadoo.fr>

pkgname=return-to-the-roots
pkgver=0.8.1.r3017.bf9fcc60
pkgrel=2
pkgdesc="Free/libre implementation of The Settlers II game engine"
arch=("i686" "x86_64")
url="https://siedler25.org/"
license=("GPL3")
makedepends=("cmake" "git" "boost" "sdl_mixer" "curl" "lua" "miniupnpc")
depends=("sdl_mixer" "miniupnpc")
conflicts=("s25rttr" "s25rttr-nightly-bin")
install="return-to-the-roots.install"
changelog="ChangeLog"
source=("git+https://github.com/Return-To-The-Roots/s25client.git" "rttr.sh" "return-to-the-roots.install")
sha256sums=('SKIP' "ac414690d648019dab24a21b4d240acc99a0f2473f6a3144a5c827559fedad3b" "edb41253442928a2313f856021c06f6d2999b780f0426c05cd7bdb2381a627ea")

pkgver() {
	cd "s25client/"
	echo "0.8.1.r$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
	cd "s25client/"
	
	# Get modules
	git submodule update --init --recursive
}

build() {
	cd "s25client/build/"
	
	./cmake.sh --prefix="$pkgdir/usr" --RTTR_BINDIR="bin" --RTTR_DATADIR="share/s25rttr" --RTTR_LIBDIR="lib/s25rttr"
	make
}

package() {
	cd "s25client/build"
	
	# Use make based installer
	make install
	
	# Copy launch script
	mv "$srcdir/rttr.sh" "$pkgdir/usr/bin/"
	
	# Get additional files
	mkdir -p $pkgdir/usr/share/applications
	cp "$srcdir/s25client/debian/s25rttr.desktop" "$pkgdir/usr/share/applications/"
	
	mkdir -p $pkgdir/usr/share/pixmaps
	cp "$srcdir/s25client/debian/s25rttr.png" "$pkgdir/usr/share/pixmaps/"
}
