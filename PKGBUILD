# Maintainer: Magnus Groß, for email contact please see the relevant AUR commits email
_pkgname=quickcurver
pkgname="$_pkgname"-git
pkgver=0.1.r82.gb45c671
pkgrel=1
pkgdesc="Qt Material design implementation of Achtung die Kurve with online multiplayer"
arch=('i686' 'x86_64')
url="https://github.com/vimpostor/$_pkgname"
license=('GPL3')
depends=(qt6-base qt6-declarative qt6-svg)
makedepends=(git cmake ninja imagemagick)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build build
	cmake --build build --target linux-desktop-integration
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
