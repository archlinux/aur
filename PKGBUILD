# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ots
pkgver=7.1.9
pkgrel=1
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=(i686 x86_64)
url=https://github.com/khaledhosny/ots
license=(custom)
depends=(freetype2)
makedepends=(meson ninja)
conflicts=(ots-git)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz" no-tests.patch)
sha512sums=('0defa5b9d03ab76f8d5a9403d0dd6a285b42def6151bad4c1cc2baed95e7d5feeb22c79fec313644de84a015d2fa38d8bf5eabcf9ce43a96652278aeeec5f246'
            '5cbbe4d68f83505892a7e04f8a8d8f541a982b43a47839dd6320912961c3c6178874ca3c488c26333d02e64bbef7235b623a59722f6cd38b4b9e6ae5a4858aba')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/no-tests.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	rm -rf build
	arch-meson build -Dgraphite=true -Dvariations=true
	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
  	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
