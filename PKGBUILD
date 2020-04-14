# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Utkan Güngördü <utkan@freeconsole.org>

pkgname=waifu2x-ncnn-vulkan-git
_pkgname=waifu2x-ncnn-vulkan
pkgver=20200224.r3.g2041d93
pkgrel=1
pkgdesc="waifu2x converter ncnn version, runs fast on intel / amd / nvidia GPU with vulkan"
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader' 'vulkan-driver')
makedepends=('ncnn-git>=20200413.r0.g5580da45' 'git' 'cmake' 'glslang' 'vulkan-headers')
conflicts=('waifu2x-ncnn-vulkan')
provides=('waifu2x-ncnn-vulkan')
arch=('i686' 'x86_64')
source=(
    "git://github.com/nihui/waifu2x-ncnn-vulkan.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/waifu2x-ncnn-vulkan"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/waifu2x-ncnn-vulkan"

    # Fix default model path
    sed -i 's|path_t model = PATHSTR("models-cunet")|path_t model = PATHSTR("/usr/share/waifu2x-ncnn-vulkan/models-cunet")|' src/main.cpp
}

build() {
    cd "${srcdir}/waifu2x-ncnn-vulkan/src"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
    make
}

package() {

    cd "${srcdir}/waifu2x-ncnn-vulkan"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 "src/build/waifu2x-ncnn-vulkan" "${pkgdir}/usr/bin/waifu2x-ncnn-vulkan"

    cd "${srcdir}/waifu2x-ncnn-vulkan/models"
    for f in models-*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/waifu2x-ncnn-vulkan/"$f"
    done
}
