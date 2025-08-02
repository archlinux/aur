# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=tagalong
pkgname="$_pkgname"-git
pkgver=1.0.r0.gad584b3
pkgrel=1
pkgdesc="Sheet music viewer with special integration for Barbershop tags"
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
	cmake --build build --target icon-integration
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
