# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=qtarcan
pkgname="$_pkgname"-git
pkgver=0.1.r0.g0990848
pkgrel=1
pkgdesc="Qt platform abstraction platform plugin for Arcan"
arch=('i686' 'x86_64')
url="https://codeberg.org/vimpostor/$_pkgname"
license=('LGPL3' 'GPL2' 'GPL3')
depends=(arcan qt5-base qt6-base)
makedepends=(git cmake ninja pkgconf)
source=("git+$url.git")
md5sums=('SKIP')
install="$_pkgname".install
qtversions="5 6"

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	for q in $qtversions; do
		cmake -B "build$q" -G Ninja -DCMAKE_INSTALL_PREFIX="/usr" -DTARGET_QT_VERSION="$q" -DQT_PLUGIN_PREFIX="lib/qt${q#5}/plugins/platforms"
		cmake --build "build$q"
	done
}

package() {
	cd "$_pkgname"
	for q in $qtversions; do
		DESTDIR="$pkgdir" cmake --install "build$q"
	done
}
