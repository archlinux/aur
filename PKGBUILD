# Maintainer: catsout <outline941 at live.com>
# Contributor: Epix <epixtm@protonmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>


pkgname=plasma6-wallpapers-wallpaper-engine-git
pkgver=0.5.4.r68.g4a235cb
pkgrel=1
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('x86_64')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL-2.0-only')
depends=(
    "plasma5support" "gst-libav" "python-websockets" "qt6-declarative"
    "qt6-websockets" "qt6-webchannel" "vulkan-driver" "libplasma"
    "kpackage" "qt6-5compat" "qt6-webengine" "qt6-multimedia"
    "plasma-workspace" "kdeclarative"
)
makedepends=(
    "vulkan-headers" "extra-cmake-modules" "git" "cmake" "mpv"
)
optdepends=(
	"mpv: alternative video backend"
)
provides=("plasma6-wallpapers-wallpaper-engine")
conflicts=("plasma6-wallpapers-wallpaper-engine")
source=(
    "${pkgname}::git+${url}.git#branch=qt6"
    "git+https://github.com/KhronosGroup/glslang.git"
)
sha256sums=('SKIP'
            'SKIP')

prepare(){
    cd "${srcdir}/${pkgname}"
    git submodule init
    grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
    do
        repo=$(basename "${module}")
        git config "submodule.${module}.url" "${srcdir}/${repo}"
    done
    git -c protocol.file.allow=always submodule update
}
pkgver(){
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    # CMake Error: The INTERFACE_QT_MAJOR_VERSION property of 
    # "Qt6::Qml" does not agree with the value of QT_MAJOR_VERSION 
    # already determined for "WallpaperEngineKde".
    sed -i 's/Qt5 //' "${srcdir}/${pkgname}/src/CMakeLists.txt"

    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DQT_MAJOR_VERSION=6 \
        -DBUILD_QML=ON
    cmake --build build
}
package(){
    DESTDIR="${pkgdir}" cmake --install build
}
