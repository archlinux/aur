# Maintainer: SuicideCatt <random.cat.from.internet@gmail.com>

options=(!debug !strip)

pkgname=msdf-atlas-gen
pkgver=1.3
pkgrel=1
pkgdesc="MSDF font atlas generator"
url=https://github.com/Chlumsky/msdf-atlas-gen
arch=(x86_64)
license=(MIT)
depends=(tinyxml2 libpng freetype2 zlib msdfgen)
makedepends=(git cmake gcc make)
provides=(msdf-atlas-gen=$pkgver)
conflicts=(msdf-atlas-gen-git)

source=("${pkgname}-${pkgver}.tag.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
		"use_msdfgen_1_13.patch")
sha256sums=('SKIP' 'd1f23b2b927f25c9e3d8cf5a5ebcd1ece8be5ff2c4bc5b9c866eeaa84c676d19')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"

	patch --forward --strip=1 --input="$srcdir/use_msdfgen_1_13.patch"
}

build()
{
	cd "${pkgname}-${pkgver}"
	cmake -B build -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
		-DMSDF_ATLAS_NO_ARTERY_FONT=ON \
		-DMSDF_ATLAS_USE_SKIA=OFF -DMSDF_ATLAS_USE_VCPKG=OFF \
		-DMSDF_ATLAS_MSDFGEN_EXTERNAL=ON \
		-DMSDF_ATLAS_INSTALL=ON -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package()
{
	cd "${pkgname}-${pkgver}"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}
