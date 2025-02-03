# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-git
pkgver=6.4.0.r6.gafa37f9
pkgrel=1
pkgdesc="A machine learning-based video super resolution and frame interpolation framework"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x"
license=('AGPL-3.0-only')
depends=('ffmpeg' 'ncnn' 'openmp' 'vulkan-driver' 'spdlog' 'boost-libs')
makedepends=('git' 'cmake' 'clang' 'vulkan-headers' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git"
	    "git+https://github.com/k4yt3x/libreal-esrgan-ncnn-vulkan.git"
	    "git+https://github.com/k4yt3x/librealcugan-ncnn-vulkan.git"
	    "git+https://github.com/k4yt3x/librife-ncnn-vulkan.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    git rm third_party/{ncnn,spdlog,boost}
    git submodule init
	git config submodule.third_party/libreal_esrgan_ncnn_vulkan.url "${srcdir}/libreal-esrgan-ncnn-vulkan"
	git config submodule.third_party/librealcugan_ncnn_vulkan.url "${srcdir}/librealcugan-ncnn-vulkan"
	git config submodule.third_party/librife_ncnn_vulkan.url "${srcdir}/librife-ncnn-vulkan"
	git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ -DVIDEO2X_ENABLE_NATIVE=ON
    cmake --build build --config Release --parallel
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
