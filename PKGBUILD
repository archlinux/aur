# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-git
pkgname=('dxvk-mingw-git')
pkgver=2.7.1.r195.g2f9309786
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine. Windows DLL version)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader')
provides=("dxvk" "d9vk" "dxvk=$pkgver")
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
conflicts=('d9vk'  "dxvk" )
options=(!strip !buildflags staticlibs)
source=(
    "git+https://github.com/doitsujin/dxvk.git"
    "git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
    "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
    "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
    "git+https://github.com/doitsujin/dxbc-spirv.git"
    "git+https://github.com/doitsujin/libdisplay-info.git"
    "setup_dxvk.sh::https://aur.archlinux.org/cgit/aur.git/plain/setup_dxvk.sh?h=dxvk-bin"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2ca9ece1b6c36446e9f6955d3d03ab72b173c8f85539a2848febc51b38be705e')


pkgver() {
    cd dxvk
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd dxvk

    git submodule init include/{native/directx,vulkan,spirv}
    git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
    git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
    git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update include/{native/directx,vulkan,spirv}

    git submodule init subprojects/{dxbc-spirv,libdisplay-info}
    git config submodule.subprojects/dxbc-spirv.url "$srcdir/dxbc-spirv"
    git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
    git -c protocol.file.allow=always submodule update subprojects/{dxbc-spirv,libdisplay-info}

    cd subprojects/dxbc-spirv

    git submodule init submodules/spirv_headers
    git config submodule.submodules/spirv_headers.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update submodules/spirv_headers
}

build() {
    meson setup dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip
    ninja -C "build/x64"

    meson setup dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip
    ninja -C "build/x32"
}

package_dxvk-mingw-git() {
        arch=('x86_64')
        conflicts=("dxvk-bin")
        DESTDIR="$pkgdir" ninja -C "build/x32" install
        DESTDIR="$pkgdir" ninja -C "build/x64" install
        install -Dm 644 setup_dxvk.sh "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        mkdir -p "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
        chmod +x "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
}
