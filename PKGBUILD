# Set MAKEPKG_DXVK_MULTILIB to true to enable lib32 package

pkgname=(dxvk)
pkgver=3.1.1
pkgrel=1
pkgdesc="Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux / Wine."
arch=(x86_64)
url=https://github.com/doitsujin/dxvk
license=(Zlib)
makedepends=(git meson mingw-w64-gcc glfw sdl2 sdl3 vulkan-headers spirv-headers glslang)

if "${MAKEPKG_DXVK_MULTILIB:-false}"
then
    pkgname+=(lib32-dxvk)
    makedepends+=(lib32-glibc lib32-sdl3 lib32-sdl2 lib32-glfw)
fi

source=("git+https://github.com/doitsujin/dxvk.git#tag=v$pkgver"
        "git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/doitsujin/libdisplay-info.git"
        "git+https://github.com/doitsujin/dxbc-spirv.git"
        "0001-prefer-system-headers.diff")
sha256sums=('a186af690b633ca3b14037e56649d1b7135e07d0b53657976330f3ab462b2a6c'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '04d0439a304c85f4b743dc3ab1683329b165b94ee01bb3d73404f7b741c4ebb4')

prepare() {
    cd dxvk
    git submodule init
    git config --local submodule."include/native/directx".url "file://$srcdir/mingw-directx-headers"
    git config --local submodule."include/vulkan".url "file://$srcdir/Vulkan-Headers"
    git config --local submodule."include/spirv".url "file://$srcdir/SPIRV-Headers"
    git config --local submodule."subprojects/libdisplay-info".url "file://$srcdir/libdisplay-info"
    git config --local submodule."subprojects/dxbc-spirv".url "file://$srcdir/dxbc-spirv"
    git -c protocol.file.allow=always submodule update
    patch -Np1 -i ../0001-prefer-system-headers.diff

    cd "$srcdir/dxvk/subprojects/dxbc-spirv"
    git submodule init
    git config --local submodule."submodules/spirv_headers".url "file://$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update
}

build() {
    arch-meson build-linux dxvk
    "${MAKEPKG_DXVK_MULTILIB:-false}" && arch-meson build-linux32 dxvk --cross-file lib32 --libdir lib32
    # They are not suitable for mingw compiler
    CXXFLAGS="${DEBUG_CXXFLAGS}" CFLAGS="${DEBUG_CFLAGS}" LDFLAGS="" \
    arch-meson build-win32 dxvk --cross-file dxvk/build-win32.txt \
        --bindir=lib/dxvk/x32 --libdir=lib/dxvk/x32
    CXXFLAGS="${DEBUG_CXXFLAGS}" CFLAGS="${DEBUG_CFLAGS}" LDFLAGS="" \
    arch-meson build-win64 dxvk --cross-file dxvk/build-win64.txt \
        --bindir=lib/dxvk/x64 --libdir=lib/dxvk/x64
    meson compile -C build-linux
    "${MAKEPKG_DXVK_MULTILIB:-false}" && meson compile -C build-linux32
    meson compile -C build-win32
    meson compile -C build-win64
}

package_dxvk() {
    depends=(glibc)
    optdepends=('sdl2: Use SDL2 WSI driver'
                'sdl3: Use SDL3 WSI driver'
                'glfw: Use GLFW WSI driver')
    meson install -C build-linux --destdir="$pkgdir"
    meson install -C build-win32 --destdir="$pkgdir"
    meson install -C build-win64 --destdir="$pkgdir"
    find "$pkgdir/usr/lib/dxvk/x64" -type f -name "*.dll" \
        -printf "Stripping %p...\n" \
        -exec x86_64-w64-mingw32-strip {} +
    find "$pkgdir/usr/lib/dxvk/x32" -type f -name "*.dll" \
        -printf "Stripping %p...\n" \
        -exec i686-w64-mingw32-strip {} +
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" dxvk/LICENSE
}

package_lib32-dxvk() {
    depends=(lib32-glibc dxvk)
    optdepends=('lib32-sdl2: Use SDL2 WSI driver for 32-bit support'
                'lib32-sdl3: Use SDL3 WSI driver for 32-bit support'
                'lib32-glfw: Use GLFW WSI driver for 32-bit support')
    meson install -C build-linux32 --destdir="$pkgdir"
    rm -rf "$pkgdir/usr/include"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" dxvk/LICENSE
}
