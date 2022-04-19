## Maintainer: David Husička <contact@bydave.net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=1.9.2a
pkgrel=1
pkgdesc="DXVK Native is a port of DXVK to Linux which allows it to be used natively without Wine."
arch=('x86_64')
url="https://github.com/Joshua-Ashton/dxvk-native"
license=('zlib/libpng')
depends=(sdl2 vulkan-icd-loader lib32-sdl2 lib32-vulkan-icd-loader)
makedepends=(gcc meson glslang)
provides=(libdxvk libdxvk_dxgi.so libdxvk_d3d9.so libdxvk_d3d11.so)
source=("https://github.com/Joshua-Ashton/dxvk-native/archive/refs/tags/native-$pkgver.tar.gz")
sha256sums=("4e6614f5522da83fec02920f8d0fd65730169c096577066412908f0563cf1a06")


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
