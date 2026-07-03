# Contributor: taotieren <admin@taotieren.com>

pkgname=durian-ocr-git
srcname=durian-ocr
pkgver=1.0.0.r0.gbf3d466
pkgrel=1
pkgdesc=" durian-ocr is no dtk deepin-ocr. This is a ocr tool ui."
arch=('any')
url="https://github.com/dependon/durian-ocr"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
depends=(qt5-tools
         )
makedepends=(git
            qconf
            pkgconfig
            cmake
            make)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    # 先构建第三方库（ncnn / opencv-mobile）：
    # ncnn 的 platform.h 由 cmake 配置阶段从 platform.h.in 生成，
    # libncnn.a 也需要此步产出，否则主项目编译会因找不到 platform.h 而失败。
    # CMAKE_POLICY_VERSION_MINIMUM=3.5 用于兼容 ncnn/opencv 旧版 CMakeLists
    # （声明 cmake_minimum_required(VERSION 2.8.12)），新版 CMake 已移除对 <3.5 的支持。
    CMAKE_POLICY_VERSION_MINIMUM=3.5 bash build3rdparty.sh

    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make DESTDIR="$pkgdir" install
}
