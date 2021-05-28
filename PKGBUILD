# Mantainer: PumpkinCheshire <me@pumpkincheshire.top>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Utkan Güngördü <utkan@freeconsole.org>

pkgname=waifu2x-ncnn-vulkan-git
pkgver=20210521.r0.g4981ffc
pkgrel=1
pkgdesc='waifu2x converter ncnn version, runs fast on intel / amd / nvidia GPU with vulkan'
arch=('i686' 'x86_64' 'aarch64')
url=https://github.com/nihui/waifu2x-ncnn-vulkan
license=(MIT)
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang-git' 'vulkan-headers' 'ncnn')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
provides=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Fix default model path
    sed -i 's|path_t model = PATHSTR("models-cunet")|path_t model = PATHSTR("/usr/share/waifu2x-ncnn-vulkan/models-cunet")|' "${pkgname%-git}"/src/main.cpp
    sed -i 's|return get_executable_directory() + path;|return "/usr/share/waifu2x-ncnn-vulkan/" + path;|' "${pkgname%-git}"/src/main.cpp
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
    cd "${srcdir}/${pkgname%-git}/models"
    for f in models-*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-git}/"$f"
    done
}
