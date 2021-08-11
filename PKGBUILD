## Maintainer: David Husička <contact@bydave.net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=1.9.1a
pkgrel=1
pkgdesc="DXVK Native is a port of DXVK to Linux which allows it to be used natively without Wine."
arch=('x86_64')
url="https://github.com/Joshua-Ashton/dxvk-native"
license=('zlib/libpng')
depends=(sdl2 vulkan-icd-loader lib32-sdl2 lib32-vulkan-icd-loader)
makedepends=(gcc meson glslang)
provides=(libdxvk libdxvk_dxgi.so libdxvk_d3d9.so libdxvk_d3d11.so)
source=("https://github.com/Joshua-Ashton/dxvk-native/archive/refs/tags/native-$pkgver.tar.gz")
sha256sums=("2fe9065eb7817e67a69ba7623e60ae0c36a1be22cf9be65226d9f0e813921f66")


build() {
	# 64-bit
	cd $srcdir/dxvk-native-native-"${pkgver}"
	meson --buildtype "release"                       \
        --prefix "/usr/"                              \
        --strip                                       \
        -Denable_tests=true                           \
        "${srcdir}"/build

	ninja -C "${srcdir}"/build

	# 32-bit
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    cd ${srcdir}/dxvk-native-native-"${pkgver}"
    meson --buildtype "release"                       \
        --prefix "/usr/"                              \
		--libdir lib32                                \
        --strip                                       \
        -Denable_tests=false                          \
        "${srcdir}"/build-32

    ninja -C "${srcdir}"/build-32
}

package_libdxvk() {
	depends=(sdl2 vulkan-icd-loader)

	install -Dm644 "${srcdir}"/dxvk-native-native-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENCE.md

	DESTDIR="${pkgdir}" ninja -C "${srcdir}"/build install
}

package_lib32-libdxvk() {
	pkgdesc="DXVK Native is a port of DXVK to Linux which allows it to be used natively without Wine. (32-bit)"
	depends=(lib32-sdl2 lib32-vulkan-icd-loader lib32-gcc-libs)
	install -Dm644 "${srcdir}"/dxvk-native-native-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENCE.md

	DESTDIR="${pkgdir}" ninja -C "${srcdir}"/build-32 install
}
