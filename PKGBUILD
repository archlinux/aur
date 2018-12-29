# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-git
pkgname=('dxvk-win64-git' 'dxvk-win32-git')
pkgver=0.94.r6.g4e22e4b
pkgrel=2
pkgdesc="A Vulkan-based compatibility layer for Direct3D 10/11 which allows running 3D applications on Linux using Wine."
arch=('x86_64' 'i686')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
options=(!strip !buildflags staticlibs)
source=("git+https://github.com/doitsujin/dxvk.git"
    "setup_dxvk_aur.verb"
)
sha256sums=("SKIP" "0f2ac8e7c7212b23fb0dfbb5c5a5c3ea8e9c7cdc290be85c625aeaed5b06c3fe")


pkgver() {
    cd dxvk
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -D enable_tests=false
    ninja -C "build/x64"

    meson dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -D enable_tests=false
    ninja -C "build/x32"
}

_package_dxvk() {
        DESTDIR="$pkgdir" ninja -C "build/x$1" install
        mkdir -p "$pkgdir/usr/bin"
        cat setup_dxvk_aur.verb | sed s/"DXVK_ARCH=64"/"DXVK_ARCH=$1"/g > "$pkgdir/usr/share/dxvk/x$1/setup_dxvk_aur.verb"
        install -Dm 644 setup_dxvk_aur.verb "$pkgdir/usr/share/dxvk/x$1/setup_dxvk_aur.verb"
        sed "s/_ARCH/$1/g" -i "$pkgdir/usr/share/dxvk/x$1/setup_dxvk_aur.verb"
	echo "#!/bin/sh" > "$pkgdir/usr/bin/setup_dxvk$1"
	echo "winetricks --force /usr/share/dxvk/x$1/setup_dxvk_aur.verb" >> "$pkgdir/usr/bin/setup_dxvk$1"
	chmod +x "$pkgdir/usr/bin/setup_dxvk$1"
}

package_dxvk-win64-git() {
        arch=('x86_64')
        conflicts=("dxvk-win64-bin")
        provides=("dxvk" "dxvk64")
        depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'winetricks')
        _package_dxvk 64
}
package_dxvk-win32-git() {
        arch=('i686' 'x86_64')
        conflicts=("dxvk-win32-bin")
        provides=("dxvk" "dxvk32")
        depends=('lib32-vulkan-icd-loader' 'wine>=4.0rc1' 'winetricks')
        _package_dxvk 32
}
