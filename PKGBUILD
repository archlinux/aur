# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: éclairevoyant
# Contributor: David Husička <contact at bydave dot net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=2.7.1
pkgrel=2
pkgdesc="Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux"
arch=(x86_64)
url="https://github.com/doitsujin/dxvk"
license=(Zlib)
_depends=(glibc sdl2 sdl3 glfw vulkan-icd-loader)
_32depends=(lib32-glibc lib32-sdl2 lib32-sdl3 lib32-vulkan-icd-loader)
makedepends=(git glslang meson ${_depends[@]} ${_32depends[@]})
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"git+https://gitlab.freedesktop.org/JoshuaAshton/libdisplay-info.git")
sha256sums=('1a2ec0f93f4ef744b55e3ad084431f3ea6cf44eec9cd6853a4581a1401b41a00'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	[[ -d "$srcdir/build" ]] && rm -rf "$srcdir/build"
	[[ -d "$srcdir/build32" ]] && rm -rf "$srcdir/build32"
	git submodule init
	git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
	git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
	git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
	git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
	git -c protocol.file.allow=always submodule update
	sed -i "s/dependency('glfw/dependency('glfw3/g" meson.build
}

build() {
	cd "$srcdir"
	arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	"$pkgname" build

	meson compile -C build

	CFLAGS+=" -m32" CXXFLAGS+=" -m32" \
	LDFLAGS+=" -m32" arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	--pkg-config-path='/usr/lib32/pkgconfig' \
	-Dnative_glfw=disabled \
	--libdir=lib32 \
	"$pkgname" build32

	meson compile -C build32
}

package_libdxvk() {
	depends=(${_depends[@]})
	provides=(libdxvk_dxgi.so libdxvk_d3d8.so libdxvk_d3d9.so libdxvk_d3d10core.so
		libdxvk_d3d11.so)
	cd "$srcdir"

	meson install -C build --destdir "$pkgdir"
	install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lib32-libdxvk() {
	pkgdesc+=" (32-bit)"
	depends=(${_32depends[@]})
	optdepends=('libdxvk: DXVK headers')
	cd "$srcdir"

	install -Dm644 "${pkgname:6}"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	meson install -C build32 --destdir "$pkgdir"
	rm -rf "${pkgdir}/usr/include"
}
