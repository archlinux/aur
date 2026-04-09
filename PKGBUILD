# Maintainer: nathan marchiori <nathan.marchiori@gmail.com>
pkgname="drawy-git"
pkgver=r1123.84d5c47e
pkgrel=1
pkgdesc="an infinite whiteboard tool"
arch=("x86_64")
url="https://invent.kde.org/graphics/drawy"
license=('GPL-3.0-only')
depends=('qt6-base>=6.9' 'glibc' 'hicolor-icon-theme'  'zstd' 'kcoreaddons' 'kcrash' 'kwidgetsaddons' 'kconfig' 'kiconthemes' 'ki18n' 'kconfigwidgets' 'kcolorscheme' 'kxmlgui' 'syntax-highlighting' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake' 'qt6-tools' 'gcc' 'vulkan-headers' 'extra-cmake-modules' 'ninja')
provides=('drawy' 'drawy-debug')
source=('drawy-git::git+https://invent.kde.org/graphics/drawy')
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cmake --preset release -DCMAKE_SKIP_RPATH=ON -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
	cmake --build build-release
}

package() {
	cd "$pkgname"
	cmake --install build-release --prefix "$pkgdir/usr"
	if [ -d "$pkgdir/usr/DrawyCore" ]; then
		mkdir -p "$pkgdir/usr/include"
		mv "$pkgdir/usr/DrawyCore" "$pkgdir/usr/include/"
	fi
}
