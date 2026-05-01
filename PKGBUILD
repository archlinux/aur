# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Claude Sonnet 4.6.
pkgname=lib32-vkbasalt-overlay
pkgver=0.1.2
pkgrel=1
pkgdesc="Vulkan post-processing layer with in-game ImGui overlay (32-bit)"
arch=('x86_64')
url="https://github.com/Boux/vkBasalt_overlay"
license=('zlib')
depends=('lib32-gcc-libs' 'lib32-libx11' 'lib32-libxi')
makedepends=('meson' 'ninja' 'glslang' 'lib32-glibc' 'spirv-headers' 'vulkan-headers')
provides=('lib32-vkbasalt-overlay')
options=('!libtool')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Boux/vkBasalt_overlay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dcaba2e47d4a1956d9ff892ac95e1f76ac0e55a806c6119a94ab591c04b1b03c')

build() {
    cd "vkBasalt_overlay-${pkgver}"

    CFLAGS+=" -m32" \
    CXXFLAGS+=" -m32" \
    LDFLAGS+=" -m32" \
    PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
    arch-meson \
        --buildtype=release \
        --libdir=lib32 \
        build
    ninja -C build
}

package() {
    cd "vkBasalt_overlay-${pkgver}"

    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/vkBasalt-overlay.json" \
        "$pkgdir/usr/share/vulkan/implicit_layer.d/vkBasalt-overlay.x86.json"

    sed -i 's|libvkbasalt-overlay.so|lib32/libvkbasalt-overlay.so|g' \
        "$pkgdir/usr/share/vulkan/implicit_layer.d/vkBasalt-overlay.x86.json"
}