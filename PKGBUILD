# Maintainer: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>

pkgbase=dxvk-async-git
pkgname=('dxvk-async-git')
pkgver=1.10.1.r921.gf1f8d45f
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
        "dxvk.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '92db021e01bc44596dade8c5f326c42a59a9c8766810ed1ebab4c327904f42f8')

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
    git submodule update include/{native/directx,vulkan,spirv}

    patch --forward --strip=1 --input="${srcdir}/dxvk-async/dxvk-async.patch"
}

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip
    ninja -C "build/x64"

    meson dxvk "build/x32" \
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
        install -Dm 644 dxvk/setup_dxvk.sh "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        mkdir -p "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
        chmod +x "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        # Async variable
        install -Dm644 "$srcdir/dxvk.conf" "$pkgdir/etc/environment.d/dxvk.conf"
}
