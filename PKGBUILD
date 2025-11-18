# Maintainer: MaddieMewmews <maddie at mewmews dot gay>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: éclairevoyant
# Contributor: David Husička <contact at bydave dot net>

pkgbase=libdxvk-gplasync
pkgname=('libdxvk-gplasync' 'lib32-libdxvk-gplasync')
pkgver=2.7.1
pkgrel=1
pkgdesc="Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux, gplasync patch"
arch=(x86_64)
url="https://github.com/doitsujin/dxvk"
license=(Zlib)
_depends=(glibc sdl2 sdl3 glfw vulkan-icd-loader)
_32depends=(lib32-glibc lib32-sdl2 lib32-sdl3 lib32-vulkan-icd-loader)
makedepends=(git glslang meson ${_depends[@]} ${_32depends[@]})
provides=(libdxvk_dxgi.so libdxvk_d3d8.so libdxvk_d3d9.so libdxvk_d3d10core.so
	  libdxvk_d3d11.so)
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/misyltoad/mingw-directx-headers.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"git+https://gitlab.freedesktop.org/frog/libdisplay-info.git"
	"dxvk-gplasync-${pkgver}-1.patch::https://gitlab.com/Ph42oN/dxvk-gplasync/-/raw/main/patches/dxvk-gplasync-${pkgver}-1.patch?ref_type=heads&inline=false"
	"global-dxvk.conf.patch::https://gitlab.com/Ph42oN/dxvk-gplasync/-/raw/main/patches/global-dxvk.conf.patch?ref_type=heads&inline=false")
sha256sums=('1a2ec0f93f4ef744b55e3ad084431f3ea6cf44eec9cd6853a4581a1401b41a00'
            'SKIP'
            'SKIP'
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
	patch -p1 -i "$srcdir"/dxvk-gplasync-${pkgver}-1.patch
	patch -p1 -i "$srcdir"/global-dxvk.conf.patch
	sed -i "s/dependency('glfw/dependency('glfw3/g" meson.build
}

build() {
	cd "$srcdir"
	arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	dxvk build

	meson compile -C build

	CFLAGS+=" -m32" CXXFLAGS+=" -m32" \
	LDFLAGS+=" -m32" arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	--pkg-config-path='/usr/lib32/pkgconfig' \
	-Dnative_glfw=disabled \
	--libdir=lib32 \
	dxvk build32

	meson compile -C build32
}

package_libdxvk-gplasync() {
	depends=(${_depends[@]})
	conflicts=('libdxvk')
	provides+=(libdxvk=${pkgver})
	meson install -C build --destdir "$pkgdir"
	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lib32-libdxvk-gplasync() {
	pkgdesc+=" (32-bit)"
	conflicts=('lib32-libdxvk')
	provides+=(lib32-libdxvk=${pkgver})
	depends=(${_32depends[@]})
	optdepends=('libdxvk: DXVK headers')

	install -Dm644 dxvk/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	meson install -C build32 --destdir "$pkgdir"
	rm -rf "${pkgdir}/usr/include"
}
