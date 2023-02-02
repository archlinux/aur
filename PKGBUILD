# Maintainer: éclairevoyant
# Contributor: David Husička <contact at bydave dot net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=2.1
pkgrel=1
pkgdesc="Native Linux port of DXVK to allow usage without WINE"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('ZLIB')
depends=(sdl2 vulkan-icd-loader lib32-sdl2 lib32-vulkan-icd-loader)
makedepends=(git gcc meson glslang)
provides=(libdxvk libdxvk_dxgi.so libdxvk_d3d9.so libdxvk_d3d11.so)
source=(
	"git+$url.git?signed#tag=v$pkgver"
	"git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"git+https://gitlab.freedesktop.org/JoshuaAshton/libdisplay-info.git"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')
validpgpkeys=('273D040B5113B886D1A090D4C8CC613427A31C99') # Philip Rebohle <philip.rebohle@tu-dortmund.de>

prepare() {
	cd dxvk
	git submodule init
	git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
	git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
	git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
	git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
	git -c protocol.file.allow=always submodule update
}

build() {
	dxvk/package-native.sh $pkgver build --no-package
}

package_libdxvk() {
	depends=(sdl2 vulkan-icd-loader)

	find build/dxvk-native-$pkgver/usr/lib -name '*.so' \
		-exec install -Dm644 '{}' -t "$pkgdir/usr/lib/" \;
	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lib32-libdxvk() {
	pkgdesc+=" (32-bit)"
	depends=(lib32-sdl2 lib32-vulkan-icd-loader lib32-gcc-libs)

	find build/dxvk-native-$pkgver/usr/lib32 -name '*.so' \
		-exec install -Dm644 '{}' -t "$pkgdir/usr/lib32/" \;
	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
