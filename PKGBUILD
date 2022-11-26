# Maintainer: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>

pkgbase=dxvk-async-git
pkgname=('dxvk-async-git')
pkgver=2.0.r23.g57176e77
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine. Windows DLL version)"
arch=('x86_64')
url="https://github.com/Sporif/dxvk-async.git"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader')
provides=("dxvk" "d9vk" "dxvk=$pkgver")
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
conflicts=('d9vk-mingw-git' 'd9vk-bin' 'd9vk-winelib-git' "dxvk-bin" "dxvk-git" "dxvk-wine32-git" "dxvk-wine64-git" "dxvk-win32-git" "dxvk-win64-git" "dxvk-winelib-git" "dxvk-mingw-git")
options=(!strip !buildflags staticlibs)
source=("git+https://github.com/doitsujin/dxvk.git"
        "git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/Sporif/dxvk-async.git"
        "dxvk-async-env.conf"
        "setup_dxvk.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5ea0fbf7fddb45a8575ff001793011a594d999aaeb66ef95378bca950c844300'
            '0f688815530ab5e8cc89b9b45d9b1d66cd8cd5a7770fb8249339af555a30dfe7')

pkgver() {
    cd dxvk
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "${srcdir}/dxvk/"

    git submodule init include/{native/directx,vulkan,spirv}
    git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
    git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
    git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update include/{native/directx,vulkan,spirv}

    patch --forward --strip=1 --input="${srcdir}/dxvk-async/dxvk-async.patch"
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

package_dxvk-async-git() {
        arch=('x86_64')
        conflicts=("dxvk-bin" "dxvk-mingw-git")
        DESTDIR="$pkgdir" ninja -C "build/x32" install
        DESTDIR="$pkgdir" ninja -C "build/x64" install
        install -Dm 644 "$srcdir/setup_dxvk.sh" "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        mkdir -p "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
        chmod +x "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        # Async environment variable
        install -Dm644 "$srcdir/dxvk-async-env.conf" "$pkgdir/etc/environment.d/dxvk-async-env.conf"
}
