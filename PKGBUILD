# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-git
pkgname=('dxvk-win64-git' 'dxvk-win32-git' 'dxvk-windows-git')
pkgver=1.0.r1.g71186859
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 10/11 which allows running 3D applications on Linux using Wine. Windows DLL version)"
arch=('x86_64' 'i686')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
options=(!strip !buildflags staticlibs)
source=("git+https://github.com/doitsujin/dxvk.git")
sha256sums=("SKIP")


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

package_dxvk-win64-git() {
        pkgdesc="Dummy package"
        depends=("dxvk-windows-git")
}
package_dxvk-win32-git() {
        pkgdesc="Dummy package"
        depends=("dxvk-windows-git")
}

package_dxvk-windows-git() {
        arch=('x86_64')
        conflicts=("dxvk-bin")
        DESTDIR="$pkgdir" ninja -C "build/x32" install
        DESTDIR="$pkgdir" ninja -C "build/x64" install
        install -Dm 644 dxvk/setup_dxvk.sh "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        mkdir -p "$pkgdir/usr/bin"
	echo "#!/bin/sh" > "$pkgdir/usr/bin/setup_dxvk"
	echo '/usr/share/dxvk/setup_dxvk.sh $1 --symlink --without-dxgi' >> "$pkgdir/usr/bin/setup_dxvk"
        chmod +x "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
	chmod +x "$pkgdir/usr/bin/setup_dxvk"
        chown -R root:root "$pkgdir/usr/"
}
