# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: éclairevoyant
# Contributor: David Husička <contact at bydave dot net>

pkgbase=libdxvk
pkgname=('libdxvk' 'lib32-libdxvk')
pkgver=2.7
pkgrel=1
pkgdesc="Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux"
arch=(x86_64)
url="https://github.com/doitsujin/dxvk"
license=(Zlib)
_depends=(glibc sdl2 sdl3 glfw vulkan-icd-loader)
_32depends=(lib32-glibc lib32-sdl2 lib32-sdl3 lib32-vulkan-icd-loader)
makedepends=(git glslang meson ${_depends[@]} ${_32depends[@]})
provides=(libdxvk_dxgi.so libdxvk_d3d8.so libdxvk_d3d9.so libdxvk_d3d10core.so
	  libdxvk_d3d11.so)
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/Joshua-Ashton/mingw-directx-headers.git#commit=9df86f2341616ef1888ae59919feaa6d4fad693d"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=234c4b7370a8ea3239a214c9e871e4b17c89f4ab"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=8b246ff75c6615ba4532fe4fde20f1be090c3764"
	"git+https://gitlab.freedesktop.org/JoshuaAshton/libdisplay-info.git#commit=275e6459c7ab1ddd4b125f28d0440716e4888078")
sha256sums=('aab98d6d4e7dd591bccc2d550478bdccef5e885357516fd55e5bede9edd3f29c'
            '021d4102f4ed1ef86a508962c8f550b8f54bf49433a6994cff3a6f4ea992fe13'
            '9c7585e9b4a212b539201a7f295fe58329025a4a8ca238e1743d3aab2f876a05'
            'bbbdf1f65d11a5e6a1f03da5804e555af9c027e76f9dd22135a092f88b8a9b2b'
            'e341e1f897220f586c95e1843059031633d780ea08800eea023ce3282730dfe7')

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
	git cherry-pick daed0c1ce8d39e6dcc1580b753554deb7fcbd2ae
	sed -i "s/dependency('glfw/dependency('glfw3/g" meson.build
}

build() {
	cd "$srcdir"
	arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	"$pkgname" build

	meson compile -C build

	CC="gcc -m32" CXX="g++ -m32" \
	LDFLAGS="$LDFLAGS -m32" \
	arch-meson -Dbuild_id=true \
	--force-fallback-for=libdisplay-info \
	--pkg-config="/usr/lib32/pkgconfig" \
	--libdir=lib32 \
	"$pkgname" build32

	meson compile -C build32
}

package_libdxvk() {
	depends=(${_depends[@]})
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
