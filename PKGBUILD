# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo-git
pkgver=15.0.r208.gbe10a3b
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL-2.0-or-later')
depends=('ncurses')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	sed -i '/install/d' CMakeLists.txt
}

build() {
	local cmake_options=(
		-B build
		-S "$pkgname"
		-Wno-dev
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	# cmake script does not install the binary
	install -Dm755 build/neoleo -t "$pkgdir/usr/bin"
}
