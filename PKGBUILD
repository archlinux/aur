# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=kunifiedpush
pkgname=$_pkgname-git
pkgver=r293.77e2803
pkgrel=1
pkgdesc='UnifiedPush client library and distributor daemon.'
arch=('x86_64')
url='https://invent.kde.org/libraries/kunifiedpush'
license=('LGPL-2.0-or-later')
depends=(
	kcmutils
	kconfigwidgets
	kdbusaddons
	kdoctools
	kiconthemes
	kirigami-addons
	knotifications
	kservice
	qt6-declarative
)
makedepends=(git extra-cmake-modules wayland-protocols cmake ninja)
optdepends=()
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd $srcdir/$_pkgname
	CMAKE_BUILD_TYPE="Release" cmake -G Ninja -S . -B build -Wno-dev
	ninja -C build
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR=$pkgdir cmake --install build --prefix /usr
	install -Dm644 src/interfaces/org.kde.kunifiedpush.distributor.Management.xml "$pkgdir"/usr/share/dbus-1/interfaces/org.kde.kunifiedpush.distributor.Management.xml
	install -Dm644 src/interfaces/org.unifiedpush.Connector1.xml "$pkgdir"/usr/share/dbus-1/interfaces/org.unifiedpush.Connector1.xml
	install -Dm644 src/interfaces/org.unifiedpush.Distributor1.xml "$pkgdir"/usr/share/dbus-1/interfaces/org.unifiedpush.Distributor1.xml
}
