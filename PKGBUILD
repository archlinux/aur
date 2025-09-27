# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgname=anime4kcpp-git
pkgver=v3.0.0.r4.g92a363a
pkgrel=1
pkgdesc="A high performance anime upscaler"
arch=("x86_64")
url="https://github.com/TianZerL/Anime4KCPP"
license=('MIT' 'GPL3') # Video module is GPLv3
depends=('opencv' 'ocl-icd' 'ffmpeg' 'qt6-base' 'vapoursynth' 'avisynthplus')
makedepends=('git' 'cmake' 'qt6-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "${pkgname%-git}::git+https://github.com/TianZerL/Anime4KCPP.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    # Compile against QT6 instead of QT5.
    sed -i 's/find_package(QT NAMES Qt6 Qt5 COMPONENTS Widgets LinguistTools REQUIRED)/find_package(QT NAMES Qt6 COMPONENTS Widgets LinguistTools REQUIRED)/' cmake/dependency/qt.cmake
    # Fix a compiler error in ac_gui. Remove once fixed upstream!
    sed -i 's/gConfig.upscaler.processor.toLocal8Bit()/gConfig.upscaler.processor.toLocal8Bit().constData()/' gui/src/Upscaler.cpp
}

build() {
    cd "${pkgname%-git}"

    mkdir -p build && cd build
    cmake .. -DAC_CORE_WITH_OPENCL=ON -DAC_CORE_ENABLE_FAST_MATH=ON -DAC_BUILD_CLI=ON -DAC_BUILD_GUI=ON -DAC_BUILD_VIDEO=ON -DAC_BUILD_FILTER_AVISYNTH_VAPOURSYNTH=ON -DAC_ENABLE_LTO=ON # AC_PRESET_RELEASE without CUDA and with LTO
    cmake --build . --config Release -j$(nproc)
}

package() {
    cd "${pkgname%-git}"

    # Binaries
    install -Dm755 "build/bin/ac_cli" "$pkgdir/usr/bin/ac_cli"
    install -Dm755 "build/bin/ac_gui" "$pkgdir/usr/bin/ac_gui"

    # Filters
    install -Dm644 "build/bin/libac_filter_avs_vs.so" "$pkgdir/usr/lib/vapoursynth/libac_filter_avs_vs.so"

    # License and Docs
    install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "LICENSE-GPLv3" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "readme.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
