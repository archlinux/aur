# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname='pkedit-qt'
pkgname="$_pkgname-git"
pkgver=v0.0.2.r1.g425edc1
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
source=(
	"$_pkgname::git+$url"
	'pkedit-qt.desktop'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
b2sums=(
	'SKIP'
	'3dde226f5dad5bf01397d3885822bef863ba39e94f6c5ebeec641bfef0cb716eb3f26b471be9d6d0c63a537fd21ff22a2b9f4e27c63fb255bae9d0aefbdb2a7b'
)

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
	install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm644 "$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
	install -Dm644 'pkedit-qt.desktop' -t "$pkgdir/usr/share/applications/"
}
