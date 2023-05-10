# Maintainer: catsout <outline941 at live.com>
# Contributor: Epix <epixtm@protonmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine-git
pkgver=0.5.4.r29.g8f167c3
pkgrel=1
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('x86_64')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL2')
depends=(
    "plasma-framework" "gst-libav" "python-websockets" "qt5-declarative" 
    "qt5-websockets" "qt5-webchannel" "vulkan-driver"
)
makedepends=(
    "vulkan-headers" "extra-cmake-modules" "git" "cmake" "mpv"
    "kdelibs4support"
)
optdepends=(
	"mpv: alternative video backend"
)
provides=("plasma5-wallpapers-wallpaper-engine")
conflicts=("plasma5-wallpapers-wallpaper-engine")
source=(
    "${pkgname}::git+${url}.git"
    "git+https://github.com/KhronosGroup/glslang.git"
    "https://github.com/catsout/wallpaper-engine-kde-plugin/pull/288.diff"
    )
sha256sums=('SKIP'
            'SKIP'
            '8aa1af2cdb0b63cd881439346c85ee0013b01c4733c5268eccd802e1e9946af2')

prepare(){
    cd "${srcdir}/${pkgname}"
    git apply "${srcdir}/288.diff"
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
    cd "${srcdir}/${pkgname}"
    cmake -B build . \
        -DCMAKE_BUILD_TYPE=Release \
        --install-prefix="$(kf5-config --prefix)"
    cmake --build build
}
package(){
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
}
