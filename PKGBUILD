# Maintainer: reakjra <reakjra@proton.me>
pkgbase=vknemu
pkgname=('vknemu' 'lib32-vknemu')
pkgver=0.1.2
pkgrel=1
pkgdesc='input based idle frame limiter vulkan layer'
arch=('x86_64')
url='https://github.com/reakjra/vkNemu'
license=('GPL-3.0-or-later')
makedepends=('meson' 'ninja' 'vulkan-headers' 'wayland-protocols'
             'wayland' 'libxcb' 'libx11' 'vulkan-icd-loader'
             'lib32-wayland' 'lib32-libxcb' 'lib32-libx11' 'lib32-vulkan-icd-loader')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('698161f2152cbda48f8567e1ce90ae52af0b5d84c4682c8b77b7aa97aaab9bcd')

build() {
    cd vkNemu-$pkgver
    arch-meson build -Drelocatable_layer=true
    meson compile -C build
    meson setup build32 --prefix=/usr --libdir=lib32 --buildtype=plain \
        --cross-file cross/i686-pc-linux-gnu.ini -Drelocatable_layer=true
    meson compile -C build32
}

package_vknemu() {
    depends=('wayland' 'libxcb')
    cd vkNemu-$pkgver
    meson install -C build --destdir "$pkgdir"
}

package_lib32-vknemu() {
    pkgdesc='input based idle frame limiter vulkan layer (32-bit)'
    depends=('vknemu' 'lib32-wayland' 'lib32-libxcb')
    cd vkNemu-$pkgver
    meson install -C build32 --destdir "$pkgdir"
    rm -r "$pkgdir/usr/share"
}
