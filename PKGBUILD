# Maintainer: catsout <outline941 at live.com>
# Contributor: Epix <epixtm@protonmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>


pkgname=plasma6-wallpapers-wallpaper-engine-git
pkgver=0.5.4.r108.g9e60b36
pkgrel=2
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('x86_64')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL-2.0-only')
depends=("gcc-libs" "glibc" "kcmutils" "kirigami" "libglvnd" "libplasma"
         "lz4" "qt6-base" "vulkan-icd-loader")
makedepends=("cmake" "extra-cmake-modules" "git" "mpv" "ninja" "vulkan-headers")
optdepends=("mpv: alternative video backend")
provides=("plasma6-wallpapers-wallpaper-engine")
conflicts=("plasma6-wallpapers-wallpaper-engine")
source=("${pkgname}::git+${url}.git#branch=main"
        "backend_scene::git+https://github.com/catsout/wallpaper-scene-renderer.git"
        "git+https://github.com/KhronosGroup/glslang.git"
        "nlohmann::git+https://github.com/nlohmann/json.git"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git"
        "Eigen::git+https://gitlab.com/libeigen/eigen.git"
        "git+https://github.com/mackron/miniaudio.git"
        "git+https://github.com/google/googletest.git"
        "pr-547.diff::https://github.com/catsout/wallpaper-engine-kde-plugin/pull/547.diff")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e00b5a7904c83dc7d349d8b082d218c7ab541fdf262ec4c68df3e83bf0d5914e')

prepare(){
    declare -ra modules=("${srcdir}/${pkgname}" "${srcdir}/${pkgname}/src/backend_scene"
                         "${srcdir}/${pkgname}/src/backend_scene/third_party/SPIRV-Reflect")
    for p in "${modules[@]}"
    do
        cd "${p}"
        git submodule init
        grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
        do
            repo=$(basename "${module}")
            git config "submodule.${module}.url" "file://${srcdir}/${repo}"
        done
        git -c protocol.file.allow=always submodule update --remote
    done
    cd "${srcdir}/${pkgname}"
    git apply "$srcdir/pr-547.diff"
}
pkgver(){
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cmake -B build -S "${srcdir}/${pkgname}" -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DQT_MAJOR_VERSION=6 \
        -DBUILD_QML=ON \
        -DUSE_PLASMAPKG=OFF
    cmake --build build
}
package(){
    depends+=("kdeclarative" "plasma-workspace" "plasma5support"
              "python" "python-websockets" "qt6-5compat"
              "qt6-declarative" "qt6-multimedia" "qt6-webchannel"
              "qt6-webengine" "qt6-websockets" "gst-libav")
    DESTDIR="${pkgdir}" cmake --install build
}
