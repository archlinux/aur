# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: éclairevoyant
# Contributor: David Husička <contact at bydave dot net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=2.5.3
pkgrel=1
pkgdesc="Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux"
arch=(x86_64)
url="https://github.com/doitsujin/dxvk"
license=(Zlib)
_depends=(glibc sdl2 sdl3 vulkan-icd-loader)
_32depends=(lib32-glibc lib32-sdl2 lib32-sdl3 lib32-vulkan-icd-loader)
makedepends=(git glslang meson ${_depends[@]} ${_32depends[@]})
provides=(libdxvk_dxgi.so libdxvk_d3d8.so libdxvk_d3d9.so libdxvk_d3d10core.so
	  libdxvk_d3d11.so)
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"git+https://gitlab.freedesktop.org/JoshuaAshton/libdisplay-info.git")
sha256sums=('5b9a483de6b7aeafb900bcaeae3163106c47787ad741d9d3cfe2cabc08d9fa53'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd dxvk
	[[ -d "$srcdir/build" ]] && rm -rf "$srcdir/build"
	[[ -d "$srcdir/build32" ]] && rm -rf "$srcdir/build32"
	git submodule init
	git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
	git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
	git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
	git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	dxvk build

	meson compile -C build

	CC="gcc -m32" CXX="g++ -m32" \
	LDFLAGS="$LDFLAGS -m32" \
	arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	--pkg-config="/usr/lib32/pkgconfig" \
	--libdir=lib32 \
	dxvk build32

	meson compile -C build32
}

package_libdxvk() {
	depends=(${_depends[@]})

	meson install -C build --destdir "$pkgdir"
	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lib32-libdxvk() {
	pkgdesc+=" (32-bit)"
	depends=(${_32depends[@]})
	optdepends=('libdxvk: DXVK headers')

	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	meson install -C build32 --destdir "$pkgdir"
	rm -rf "${pkgdir}/usr/include"
}
