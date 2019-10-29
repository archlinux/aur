# Maintainer: nikos fytilis n - fit [at] live [dot] com
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-winelib
pkgname=('dxvk-winelib')
pkgver=1.4.4
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 10/11 which allows running 3D applications on Linux using Wine. Winelib version. Auto gets latest tag!"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'wine')
conflicts=("dxvk-bin" "dxvk-git" "dxvk-wine32-git" "dxvk-wine64-git" "dxvk-win32-git" "dxvk-win64-git" "dxvk-mingw-git" "dxvk-winelib-git")
source=("git+https://github.com/doitsujin/dxvk.git"  )
sha256sums=("SKIP")

pkgver() {
    cd dxvk
    git fetch --tags 1>2&
    a=`git tag | tail -n1`
    echo $a | sed 's/v//g'
    git checkout $a 1>2&
}

build() {

    meson dxvk "build/x64" \
        --cross-file dxvk/build-wine64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -D enable_tests=false
    ninja -C "build/x64"

    meson dxvk "build/x32" \
        --cross-file dxvk/build-wine32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -D enable_tests=false
    ninja -C "build/x32"
}

package_dxvk-winelib() {
        DESTDIR="$pkgdir" ninja -C "build/x32" install
        DESTDIR="$pkgdir" ninja -C "build/x64" install
        install -Dm 644 dxvk/setup_dxvk.sh "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        mkdir -p "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
        chmod +x "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
}
