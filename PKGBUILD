# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Utkan Güngördü <utkan@freeconsole.org>

pkgname=waifu2x-ncnn-vulkan-git
pkgver=20200818.r1.gb152fc7
pkgrel=1
pkgdesc='waifu2x converter ncnn version'
url=https://github.com/nihui/waifu2x-ncnn-vulkan
license=(MIT)
depends=(vulkan-icd-loader libwebp)
makedepends=(git cmake glslang vulkan-headers ncnn)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
arch=(i686 x86_64)
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Fix default model path
    sed -i 's|path_t model = PATHSTR("models-cunet")|path_t model = PATHSTR("/usr/share/waifu2x-ncnn-vulkan/models-cunet")|' "${pkgname%-git}"/src/main.cpp
}

build() {
    cmake -B build -S "${pkgname%-git}"/src \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -DUSE_SYSTEM_NCNN=on \
        -DUSE_SYSTEM_WEBP=on
    cmake --build build
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" build/${pkgname%-git}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname%-git}/LICENSE
    for f in "${pkgname%-git}"/models/models-*/*; do
        install -Dm644 -t "${pkgdir}/usr/share/${pkgname%-git}" "$f"
    done
}
