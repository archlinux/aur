pkgname=plasma5-wallpapers-wallpaper-engine-without-mpv-git
pkgver=r441.791240d
pkgrel=2
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine (without mpv version)"
arch=('any')
url="https://github.com/j1g5awi/wallpaper-engine-kde-plugin/tree/without-mpv"
license=('GPL2')
depends=('qt5-declarative' 'python-websockets' 'plasma-framework' 'qt5-websockets' 'qt5-webchannel' 'qt-gstreamer' 'vulkan-headers')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("plasma5-wallpapers-wallpaper-engine-without-mpv-git::git+https://github.com/j1g5awi/wallpaper-engine-kde-plugin.git#branch=without-mpv")
md5sums=('SKIP')
build() {
	cd "$pkgname"
	git submodule update --init
	mkdir -p build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) ..
	make
}
package() {
	cd "$pkgname"
	cd build
	make DESTDIR="$pkgdir/" install
}
pkgver() {
	cd "$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
