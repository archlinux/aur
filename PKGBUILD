# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=qtarcan
pkgname="$_pkgname"-git
pkgver=r46.28d900e
pkgrel=1
pkgdesc="Qt platform abstraction platform plugin for Arcan"
arch=('i686' 'x86_64')
url="https://codeberg.org/vimpostor/$_pkgname"
license=('LGPL3' 'GPL2' 'GPL3')
depends=(arcan qt6-base)
makedepends=(git cmake ninja pkgconf)
source=("git+$url.git")
md5sums=('SKIP')
install="$_pkgname".install

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX="/usr" -DQT_PLUGIN_PREFIX='lib/qt6/plugins/platforms'
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
