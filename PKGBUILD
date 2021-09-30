# Maintainer: Darvin Delgado <dnmodder@gmail.com>
# Contributor: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: aldelaro5 <aldelaro5@gmail.com>

_pkgname='decaf-emu'
pkgname="${_pkgname}-git"
pkgver=r5112.dd444a08
pkgrel=1
pkgdesc="An experimental open-source Nintendo Wii U emulator"
arch=('x86_64')
url="https://github.com/decaf-emu/decaf-emu"
license=('GPL3')
depends=('curl' 'ffmpeg' 'c-ares' 'openssl' 'qt5-base' 'qt5-svg' 'sdl2' 'vulkan-icd-loader' 'zlib')
makedepends=('cmake' 'c-ares' 'glslang' 'git' 'python' 'vulkan-validation-layers')
optdepends=('qt5-wayland: for Wayland support')
source=("git+$url"
        "qtads::git+https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System"
        "catch::git+https://github.com/philsquared/Catch"
        "addrlib::git+https://github.com/decaf-emu/addrlib"
        "cereal::git+https://github.com/USCiLab/cereal"
        "cnl::git+https://github.com/decaf-emu/cnl"
        "cpp-peglib::git+https://github.com/yhirose/cpp-peglib"
        "cpptoml::git+https://github.com/decaf-emu/cpptoml"
        "excmd::git+https://github.com/exjam/excmd"
        "fmt::git+https://github.com/fmtlib/fmt"
        "glslang::git+https://github.com/KhronosGroup/glslang"
        "gsl-lite::git+https://github.com/gsl-lite/gsl-lite"
        "imgui::git+https://github.com/ocornut/imgui"
        "libbinrec::git+https://github.com/decaf-emu/libbinrec"
        "ovsocket::git+https://github.com/exjam/ovsocket"
        "pugixml::git+https://github.com/zeux/pugixml"
        "spdlog::git+https://github.com/gabime/spdlog"
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"

    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    git submodule init
    for mod_url in ${source[@]:1}
    do
      mod_name=${mod_url%%:*}
      echo $mod_name
      git config submodule.libraries/$mod_name.url $srcdir/$mod_name
    done

    git submodule update
}

build() {
    cd "$srcdir/$_pkgname"

    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DDECAF_QT=ON
    make
}

package() {
    cd "$srcdir/$_pkgname/build"

    make DESTDIR="$pkgdir" install
}
