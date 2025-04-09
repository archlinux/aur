# Maintainer: User0 <user0thenyancat@proton.me>
pkgname=einstein-emulator
pkgver="2024.12.26"
pkgrel=1
pkgdesc="NewtonOS running on other operating systems "
arch=('x86_64')
url="https://github.com/pguyot/Einstein"
license=('GPL-2.0')
options=('!emptydirs')
depends=(
    "libbsd"
    "libpulse"
)
makedepends=(
    "clang"
    "cmake"
    "libbsd"
    "libpulse"
)
source=(
    $pkgname-$pkgver.tar.gz::"https://github.com/pguyot/Einstein/archive/refs/tags/v$pkgver.tar.gz"
    "einstein.desktop"
)
sha256sums=(
    '6b8f580ed00388550ee4740ca73157e25e7ac3a3dd97055ba21a0591a268d447'
    '1faf3f02701cde73086aa8d51fb7e150520c4cb49d0c74f4e0618529df1006de'
)
prepare() {
	cd "$srcdir/Einstein-$pkgver"
	mkdir -p build
	cmake	-B "build" \
		-G 'Unix Makefiles' \
		-Wno-dev \
		-Wno-error
}

build() {
	cd "$srcdir/Einstein-$pkgver"
	cmake	--build "build"
}

check() {
	cd "$srcdir/Einstein-$pkgver"
	ctest --test-dir build --output-on-failure
}

package() {
	cd "$srcdir/Einstein-$pkgver"
	install -Dm755 "build/Einstein" "$pkgdir/usr/local/bin/einstein-emulator"
	chmod +x "$pkgdir/usr/local/bin/einstein-emulator"
	install -Dm644 "Resources/icons/EinsteinApp64.png" "$pkgdir/usr/share/pixmaps/einstein-emulator.png"
	install -Dm644 "Resources/icons/EinsteinApp512.png" "$pkgdir//usr/share/icons/hicolor/512x512/apps/einstein-emulator.png"
	install -Dm644 "$srcdir/einstein.desktop" "${pkgdir}/usr/share/applications/einstein-emulator.desktop"
}
