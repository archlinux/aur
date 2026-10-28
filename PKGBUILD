# Maintainer: dec05eba <dec05eba@protonmail.com>
# Contributor: hexchain <arch at hexchain dot org>

pkgname=vk-hdr-layer-phoenix
pkgver=1.0.0
pkgrel=1
_commit=e03dd0d109353929f5d9b54961e4a488e3844319
_srcname=VK_hdr_layer-${_commit}
_vkroots_commit=e554d4c184805523d6db3642afcde85e9d83c50c
pkgdesc="Vulkan Wayland HDR WSI Layer"
url=https://github.com/dec05eba/VK_hdr_layer
license=("MIT")
arch=(x86_64)
makedepends=("meson" "libx11" "vulkan-headers" "vulkan-icd-loader")
depends=("glibc" "gcc-libs" "wayland")
provides=("vk-hdr-layer")
conflicts=("vk-hdr-layer" "vk-hdr-layer-kwin6-git")
source=(
    "${_srcname}.tar.gz::$url/archive/${_commit}.tar.gz"
    "vkroots-${_vkroots_commit}.tar.gz::https://github.com/Joshua-Ashton/vkroots/archive/${_vkroots_commit}.tar.gz"
)
sha256sums=('450c34d595eb99a9efa50a3aae436069af72df059ad3da6196c51258996fc61b'
            '91f21745af4527b7ac6607ae3da377f3b46171719a30459d3ead20aa8e7b5ef2')

prepare() {
    rm -rf "$_srcname/subprojects/vkroots"
    ln -s "$srcdir/vkroots-${_vkroots_commit}" "$_srcname/subprojects/vkroots"
}

build() {
    cd "$_srcname"

    arch-meson . build
    meson compile -C build
}

package() {
    cd "$_srcname"
    meson install -C build --destdir "$pkgdir" --skip-subprojects vkroots
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
