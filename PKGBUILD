# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: éclairevoyant
# Contributor: David Husička <contact at bydave dot net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=2.5.0
pkgrel=1
pkgdesc="Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux"
arch=(x86_64)
url="https://github.com/doitsujin/dxvk"
license=(Zlib)
_depends=(glibc sdl2 sdl3 vulkan-icd-loader)
_32depends=(lib32-glibc lib32-sdl2 lib32-sdl3 lib32-vulkan-icd-loader)
depends=(${_depends[@]} ${_32depends[@]})
makedepends=(git glslang meson ${depends[@]})
provides=(libdxvk_dxgi.so libdxvk_d3d8.so libdxvk_d3d9.so libdxvk_d3d10core.so
	  libdxvk_d3d11.so)
source=("git+$url.git#tag=v${pkgver::-2}"
	"git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"git+https://gitlab.freedesktop.org/JoshuaAshton/libdisplay-info.git"
	"project-version.patch::$url/commit/e6209d28cd9c51ad371605db4c0de27547c0d28c.patch")
sha256sums=('5673200b157616580aab6e75086f276b2acc2af31c5553c2269a6a8c1481548b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8d74f24ddefb76f2b8260f70aa449b18e25599177c67c882fb766692d59a1dd9')

prepare() {
	cd dxvk
	patch -p1 < "$srcdir/project-version.patch"
	git submodule init
	git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
	git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
	git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
	git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
	git -c protocol.file.allow=always submodule update
}

build() {
	dxvk/package-native.sh $pkgver build --no-package --build-id
}

package_libdxvk() {
	depends=(${_depends[@]})

	install -dm755 "$pkgdir/usr/lib"
	find build/dxvk-native-$pkgver/usr/lib -name '*.so*' \
		-exec cp -a '{}' "$pkgdir/usr/lib/" \;
	find "$pkgdir/usr/lib" -name '*.so*' \
		-exec chmod 755 '{}' \;
	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lib32-libdxvk() {
	pkgdesc+=" (32-bit)"
	depends=(${_32depends[@]})

	install -dm755 "$pkgdir/usr/lib32"
	find build/dxvk-native-$pkgver/usr/lib32 -name '*.so*' \
		-exec cp -a '{}' "$pkgdir/usr/lib32/" \;
	find "$pkgdir/usr/lib32" -name '*.so*' \
		-exec chmod 755 '{}' \;
	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
