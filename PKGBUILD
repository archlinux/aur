# Maintainer: shtrophic <aur at shtrophic dot net>

pkgbase=moderncore
pkgname=(vv iv)
pkgver=20250421
pkgrel=1
_tracy_commit=753305a
pkgdesc="parts of an abandoned Wayland compositor repurposed for image viewers"
arch=('x86_64')
url="https://github.com/wolfpld/moderncore"
license=('BSD-3-Clause')
makedepends=(
	git
	cmake
	ninja
	python
	openmp
	wayland-protocols
	vulkan-headers
	vulkan-utility-libraries
	shaderc
	libsixel
	libxkbcommon
)
depends=(
	cairo
	lcms2
	libexif
	libheif
	libjpeg
	libjxl
	libpng
	libraw
	librsvg
	libtiff
	libwebp
	lz4
	openexr
	pugixml
)
optdepends=(
	poppler-glib
)
source=(
	"$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"tracy::git+https://github.com/wolfpld/tracy.git#tag=$_tracy_commit"
	"vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#tag=v3.2.1"
	"stb::git+https://github.com/nothings/stb.git#tag=2e2bef463a5b53ddf8bb788e25da6b8506314c08"
	"base64::git+https://github.com/aklomp/base64.git#tag=v0.5.2"
)
sha256sums=('510adcb5de0e5cef113bde595a33d14a8e486bed479462822f930f278de68f42'
            '5038c4bd3219d6be946285ae867e233c5285015f4c40f7272f6028fae07e0604'
            '3ba3a3b0e349e7731e862e9826ac9ba0f1122fa3eda2ada3eb22c3930108d768'
            'e2e76a8585a9b52cd0d774a4637a55f0ab9edb3ba10f852f69e1243134c17b90'
            'c2139ed6cc36779410ebf291df9f231145ed1c8ee0f16b6046331daa686058b7')

build() {
	local MARCH_NATIVE=OFF
	if [[ "$MAKEFLAGS" == *"-march=native"* ]]; then
		MARCH_NATIVE=ON
	fi

	echo "MARCH_NATIVE=$MARCH_NATIVE"

	cmake -G Ninja -B build -S "$srcdir/$pkgbase-$pkgver" -Wno-dev \
		-DCPM_LOCAL_PACKAGES_ONLY=ON \
		-DCPM_tracy_SOURCE="$srcdir/tracy" \
		-DCPM_vma_SOURCE="$srcdir/vma" \
		-DCPM_stb_SOURCE="$srcdir/stb" \
		-DCPM_base64_SOURCE="$srcdir/base64" \
		-DTRACY_ENABLE=OFF \
		-DBUILD_SHARED_LIBS=OFF \
		-DMARCH_NATIVE=$MARCH_NATIVE \
		-DSANITIZE=OFF \
		-DBUILD_MCORE=OFF \
		-DBASE64_WITH_OpenMP=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package_vv() {
	pkgdesc="Terminal image viewer with broad codec support"
	depends+=(libsixel zlib)
	conflicts=(vv-bin)

	install -Dm 755 "$srcdir/build/vv" -t "$pkgdir/usr/bin"
	install -Dm 644 "$srcdir/$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/vv"
	install -Dm 644 "$srcdir/$pkgbase-$pkgver/doc/vv.md" "$pkgdir/usr/share/doc/vv/README.md"
}

package_iv() {
	pkgdesc="Wayland application that can display HDR images"
	depends+=(vulkan-icd-loader libxkbcommon)
	optdepends+=(vk-hdr-layer-kwin6-git)

	install -Dm 755 "$srcdir/build/iv" -t "$pkgdir/usr/bin"
	install -Dm 644 "$srcdir/$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/iv"
	install -Dm 644 "$srcdir/$pkgbase-$pkgver/doc/iv.md" "$pkgdir/usr/share/doc/iv/README.md"
	install -Dm 644 "$srcdir/$pkgbase-$pkgver/src/tools/iv/desktop/iv.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm 644 "$srcdir/$pkgbase-$pkgver/src/tools/iv/assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/iv.svg"
}
