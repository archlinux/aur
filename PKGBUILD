# Maintainer: catsout <outline941 at live.com>
# Contributor: Epix <epixtm@protonmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>


pkgname=plasma5-wallpapers-wallpaper-engine-git
pkgver=0.5.4.r42.g345570d
pkgrel=3
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('x86_64')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL-2.0-only')
depends=(
    "plasma-framework5" "gst-libav" "python-websockets" "qt5-declarative"
    "qt5-websockets" "qt5-webchannel" "vulkan-driver"
)
makedepends=(
    "vulkan-headers" "extra-cmake-modules" "git" "cmake" "mpv"
)
optdepends=(
	"mpv: alternative video backend"
)
provides=("plasma5-wallpapers-wallpaper-engine")
conflicts=("plasma5-wallpapers-wallpaper-engine")
source=(
    "${pkgname}::git+${url}.git"
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
    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build
}
package(){
    DESTDIR="${pkgdir}" cmake --install build
}
