# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=vv
pkgver=3.0.1
pkgrel=1
license=(BSD-3-Clause)
url="https://github.com/wolfpld/vv"
pkgdesc="Terminal image viewer"
arch=(x86_64)
conflicts=(vv-bin) # same name, different program!
makedepends=(git cmake)
depends=(
	cairo
        lcms2
	libheif
	libjpeg
	libjxl
	libpng
	libraw
	librsvg
	libsixel
	libtiff4
	libwebp
	openexr
	openmp
	zlib
)
optdepends=(
	poppler-glib
)

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"base64::git+https://github.com/aklomp/base64.git#tag=v0.5.2"
	"tracy::git+https://github.com/wolfpld/tracy.git" # master
	"stb::git+https://github.com/nothings/stb.git#tag=2e2bef463a5b53ddf8bb788e25da6b8506314c08"
)
sha256sums=('6bed3181f31588259184599bf8e275cf2c20dd1beddee24889cfa6a828bbcbbe'
            'c2139ed6cc36779410ebf291df9f231145ed1c8ee0f16b6046331daa686058b7'
            'SKIP'
            'e2e76a8585a9b52cd0d774a4637a55f0ab9edb3ba10f852f69e1243134c17b90')

build() {
	cmake -B build -S "$srcdir/$pkgname-$pkgver" \
		-DCPM_LOCAL_PACKAGES_ONLY=ON \
		-DCPM_tracy_SOURCE="$srcdir/tracy" \
		-DCPM_stb_SOURCE="$srcdir/stb" \
		-DCPM_base64_SOURCE="$srcdir/base64" \
		-DBASE64_WITH_OpenMP=ON \
		-DTRACY_ENABLE=OFF \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	install -Dm 755 "$srcdir/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

