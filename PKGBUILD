# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=kwi-git
pkgver=r101.1df8741
pkgrel=1
epoch=
pkgdesc="Kwi is a modern and fast terminal for KDE Plasma and other desktops built on libghostty-vt"
arch=('x86_64')
url="https://apps.kde.org/kwi/"
license=('GPL-2.0-only OR GPL-3.0-only OR LicenseRef-scancode-kde-accepted-gpl'
'LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-scancode-kde-accepted-lgpl'
'GPL-2.0-or-later'
'LGPL-2.0-or-later'
'CC0-1.0'
'BSD-2-Clause'
)
groups=()
depends=('kirigami-app-components' 'glibc' 'qt6-declarative' 'kxmlgui' 'kparts'
	 'kwindowsystem' 'kwidgetsaddons' 'kguiaddons' 'kdbusaddons' 'ki18n'
	 'knotifications' 'kcoreaddons' 'qt6-base' 'kirigami' 'kirigami-addons'
	 'hicolor-icon-theme' 'libstdc++' 'kconfig' 'kpty' 'libghostty-vt' 'union' 'kconfigwidgets' 'kio')
makedepends=('git' 'cmake' 'ninja' 'extra-cmake-modules' 'vulkan-headers' 'qqc2-desktop-style' 'appstream')
checkdepends=()
optdepends=()
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("git+https://invent.kde.org/utilities/kwi.git")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S kwi \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_SKIP_INSTALL_RPATH=ON \
	-DBUILD_COVERAGE=OFF \
	-DBUILD_TESTING=OFF \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
	pushd "$pkgdir/usr/share/licenses/kwi"
	mv LicenseRef-KDE-Accepted-GPL.txt LicenseRef-scancode-kde-accepted-gpl.txt
	mv LicenseRef-KDE-Accepted-LGPL.txt LicenseRef-scancode-kde-accepted-lgpl.txt
	popd
	mv "$pkgdir/usr/share/licenses/kwi" "$pkgdir/usr/share/licenses/kwi-git"
}
