# Maintainer: catsout <outline941 at live.com>
# Contributor: Epix <epixtm@protonmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>


pkgname=plasma6-wallpapers-wallpaper-engine-git
pkgver=0.5.4.r44.ge803d26
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
    "${pkgname}::git+${url}.git"
    "git+https://github.com/KhronosGroup/glslang.git"
    "migrage-to-kde-plasma-6.diff::${url}/pull/344.diff"
)
sha256sums=('SKIP'
            'SKIP'
            'daf7cec351afaf6b906effb16d58600e4e1c89f16cad80dec28352de3f8b99a5')

prepare(){
    cd "${srcdir}/${pkgname}"
    git submodule init
    grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
    do
        repo=$(basename "${module}")
        git config "submodule.${module}.url" "${srcdir}/${repo}"
    done
    git -c protocol.file.allow=always submodule update
    git apply "${srcdir}/migrage-to-kde-plasma-6.diff"
}
pkgver(){
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
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
