# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname='pkedit-qt'
pkgname="$_pkgname-git"
pkgver=r6.e8b61d2
pkgrel=1
url="https://codeberg.org/ramenu/pkedit-qt"
pkgdesc='QT GUI frontend utilizing libpkedit'
arch=('x86_64' 'i686' 'aarch64')
makedepends=(
	'cmake' 
	'make'
)
depends=(
	'glibc'
	'libpkedit'
	'qt6-base'
)
license=('GPL-3.0-only')
source=("$_pkgname::git+$url")
conflicts=("$_pkgname")
provides=("$_pkgname")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	local cmake_options=(
	    -B build
	    -S "$_pkgname"
	    -G 'Unix Makefiles'
	    -W no-dev
	    -D CMAKE_BUILD_TYPE=Release
	    -D CMAKE_INSTALL_PREFIX=/usr
	  )
	  cmake "${cmake_options[@]}"
	  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}

