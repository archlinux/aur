# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=trackerboy-git
pkgver=v0.2.0.r331.9188399
pkgrel=1
pkgdesc="Trackerboy is a cross-platform music tracker for creating Gameboy music."
arch=('x86_64')
url="https://www.trackerboy.org"
license=('MIT')
depends=(gcc-libs glibc qt6-base rtmidi)
makedepends=('cmake>=3.12' git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::'git+https://github.com/ISSOtm/trackerboy.git#branch=patch-1'
        'git+https://github.com/stoneface86/libtrackerboy.git#tag=cpp-last'
        find_rtmidi.patch)
sha256sums=(SKIP
            bff228a66a90fa8897d031644c5b9e9bbd6a5fca9b7f983baf505e15f63f55e6
            ff2bd43cfdeef86d3698420d5c3933bb4ff1244327ee09f05091781d16fcf7b6)

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	patch -p1 <../find_rtmidi.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"

	CFLAGS="-DNDEBUG ${CFLAGS-}" cmake -S . -B build -DCMAKE_BUILD_TYPE=None -DENABLE_UNITY=ON \
		-Wno-dev -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCPM_USE_LOCAL_PACKAGES=ON \
		-DCPM_libtrackerboy_SOURCE="$srcdir/libtrackerboy"

	cmake --build build --target all
}

check() {
	cd "$srcdir/${pkgname%-git}"

	ctest --test-dir build --output-on-failure
}

package() {
	cd "$srcdir/${pkgname%-git}"

	DESTDIR="$pkgdir" cmake --install build --strip --prefix /usr --verbose
	install -Dvm 644 -t "$pkgdir/usr/share/trackerboy/examples/" examples/*

	install -Dvm 644 -t "$pkgdir/usr/share/applications" src/trackerboy.desktop
	install -Dvm 644 -t "$pkgdir/usr/share/mime" src/trackerboy.xml
	for size in 16 24 32 48 256; do
		install -Dvm 644 src/resources/icons/app/appicon-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/trackerboy.png"
		install -Dvm 644 src/resources/icons/app/appicon-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/mimetypes/x-trackerboy-module.png"
	done

	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
