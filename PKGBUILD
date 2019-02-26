# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-wine-git
pkgname=('dxvk-wine64-git' 'dxvk-wine32-git' 'dxvk-git' 'dxvk-winelib-git')
pkgver=1.0.r1.g71186859
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 10/11 which allows running 3D applications on Linux using Wine. Winelib version"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'wine')
source=("git+https://github.com/doitsujin/dxvk.git"  )
sha256sums=("SKIP")

pkgver() {
    cd dxvk
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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

package_dxvk-wine64-git() {
        pkgdesc="Dummy package"
        depends=("dxvk-winelib-git")
}

package_dxvk-wine32-git() {
        pkgdesc="Dummy package"
        depends=("dxvk-winelib-git")
}

package_dxvk-git() {
        pkgdesc="Dummy package"
        depends=("dxvk-winelib-git")
    }

package_dxvk-winelib-git() {
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
