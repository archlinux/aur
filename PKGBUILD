# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.3.4
pkgrel=5
pkgdesc="Kotatogram – experimental Telegram Desktop fork"
arch=(x86_64)
url="https://kotatogram.github.io"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
	xxhash
	zlib
	minizip
	openssl
	libdbusmenu-qt5
	hunspell
	hicolor-icon-theme
)
makedepends=(
	git
	python
	cmake
	ninja
	tl-expected
	range-v3
)
optdepends=(
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin')
source=(
	"https://github.com/kotatogram/${pkgname}/releases/download/k${pkgver}/${pkgname}-${pkgver}-full.tar.gz"
	"https://github.com/telegramdesktop/tdesktop/commit/6e9eddabfdb8b2d870f912875325ed452144b10e.patch"
	"telegram-desktop-qt5.15.patch"
	"0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
)
sha512sums=('f0255e1bcbf1703c684e3c71392156002456a988f4128107e0181b4f4b9956073c29c27ff19d8416b19b3d836da999b39a421bd9755683013eec71ff51104f38'
            'fdc3a9f589af0e9bd33fd4f988ef4eddcdccfd6c5e1d1a30d0daa016f3f76e1848e32d62ad4591b8b647d37fd2af402f70322c5560ae8045a4ebf3e00f827042'
            '6bbe0583103d575a1413141799985c7c7b590d8a9856c727320ce322679a3d38343a144c314eee54fa9776c8f3a084627a333e6860d1b8cb8f496b1702070ac0'
            'add35207d3a2772b3886f63d81751551e7ad5b6dac8ca3be4dc7bec6f126f04deaa4013d01805b524fbcdcfe7cacd94fa92c4583a62e7bd78472801d9beeb591')

prepare() {
	cd ${pkgname}-$pkgver-full
	patch -p1 < ${srcdir}/telegram-desktop-qt5.15.patch
	patch -p1 < ${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch
	patch -p1 < ${srcdir}/6e9eddabfdb8b2d870f912875325ed452144b10e.patch
}

build() {
	cd ${pkgname}-${pkgver}-full

	cmake -B build -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DTDESKTOP_API_TEST=ON \
		-DDESKTOP_APP_USE_PACKAGED_GSL=OFF \
		-DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
		-DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF \
		-DTDESKTOP_USE_PACKAGED_TGVOIP=OFF

	cmake --build build
}

package() {
	cd ${pkgname}-${pkgver}-full
	DESTDIR="$pkgdir" cmake --install build
}
