# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=realesrgan-ncnn-vulkan
_pkgname=Real-ESRGAN-ncnn-vulkan
pkgver=0.1.3.2
_pkgver="v$pkgver"
pkgrel=1
pkgdesc="NCNN implementation of Real-ESRGAN"
url="https://github.com/xinntao/Real-ESRGAN-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-driver' 'libwebp' 'gcc-libs')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers')
conflicts=('realesrgan-ncnn-vulkan-bin')
provides=('realesrgan-ncnn-vulkan')
arch=('x86_64')
source=(
    "git+https://github.com/xinntao/$_pkgname#tag=${_pkgver}"
    )

sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"
    
    if [[ -d build ]]; then
        cd build
        make
    else
        mkdir build && cd build
        cmake ../src/ \
        -DBUILD_SHARED_LIBS=1 \
        -DCMAKE_BUILD_TYPE=1 \
        -DENABLE_OPT=1 \
        -DUSE_SYSTEM_NCNN=1 \
        -DUSE_SYSTEM_WEBP=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake
    fi
        make

}

package() {
    cd "${srcdir}/${_pkgname}/build"

    install -Dm644 realesrgan-ncnn-vulkan "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"
    chmod +x "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"
}
