# Maintainer: Leandro Guedes <leanguedes@icloud.com>

pkgname=xdg-portal-test-kde-git
pkgver=r126.259f4d2
pkgrel=1
pkgdesc="Test application for Flatpak portals and Qt Flatpak platform plugin"
arch=('x86_64')
url="https://invent.kde.org/libraries/xdg-portal-test-kde"
license=('LGPL-2.1-only')
depends=(glibc
		 qt6-base
		 kio
		 gstreamer
		 kwindowsystem
		 wayland
		 qt6-wayland
		 knotifications
		 gcc-libs
		 ki18n
		 kcoreaddons)
makedepends=(git cmake extra-cmake-modules wayland-protocols)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://invent.kde.org/libraries/xdg-portal-test-kde.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	( set -o pipefail
		git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cmake -B build
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	DESTDIR="$pkgdir/" cmake --install build
}
