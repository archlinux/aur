# Maintainer: Victor Tran <vicr12345 at gmail dot com>

wayland_protocols_version=1.25

pkgname=libtdesktopenvironment
pkgver=2.0
pkgrel=1
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64" "aarch64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('libcontemporary' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr' 'qt6-wayland')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("libtdesktopenvironment-$pkgver-src"::"https://github.com/theCheeseboard/libtdesktopenvironment/archive/v$pkgver.tar.gz"
        "wayland-protocols"::"git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git#commit=f01202f"
        "wlr-protocols"::"git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git#commit=4264185"
)
sha256sums=('b1fb92be9e2a778557493b2ac819e9671dd4cb2a8f877af4ccf7c8e4805affc7'
            'SKIP'
            'SKIP')

prepare() {
	# Re-add the required Git submodules
	cd $pkgname-$pkgver/plugins/wayland/wayland-protocols/
	cp -r $srcdir/wayland-protocols/* wayland-protocols
	cp -r $srcdir/wlr-protocols/* wlr-protocols
}

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
                -DQT_WAYLAND_SCANNER=/usr/lib/qt6/qtwaylandscanner
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
