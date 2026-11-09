# Maintainer: dec05eba <dec05eba@protonmail.com>
# Contributor: hexchain <arch at hexchain dot org>

pkgname=vk-hdr-layer-phoenix
pkgver=1.0.0
pkgrel=2
_commit=7ea2db8015098a4a0dd4499b98ad1c94a25b003a
_srcname=VK_hdr_layer-${_commit}
_vkroots_commit=20733b938267dcac60f6ac105dbb757f9cc8df9c
pkgdesc="Vulkan X11 HDR WSI Layer"
url=https://github.com/dec05eba/VK_hdr_layer
license=("MIT")
arch=(x86_64)
makedepends=("meson" "libx11" "vulkan-headers" "vulkan-icd-loader")
depends=("glibc" "libgcc" "libstdc++" "libxcb" "libx11")
provides=("vk-hdr-layer")
conflicts=("vk-hdr-layer" "vk-hdr-layer-kwin6-git")
source=(
    "${_srcname}.tar.gz::$url/archive/${_commit}.tar.gz"
    "vkroots-${_vkroots_commit}.tar.gz::https://github.com/Joshua-Ashton/vkroots/archive/${_vkroots_commit}.tar.gz"
)
sha256sums=('30b572db89edc55b6dca552a87fda363cf0f5da4a972a9c5d1d8cefecdb49507'
            '863ee36f80faa84d28e1f73b588f6f52d391d210267938a57f7a8fa14b9fd1ce')

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
