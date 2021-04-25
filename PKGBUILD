# Maintainer: Brendan Szymanski <bscubed@pm.me>

_pkgname=citra
pkgname=$_pkgname-canary-git
pkgver=r9013.651c9d0d6
pkgrel=1
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
arch=('i686' 'x86_64')
url='https://github.com/citra-emu/citra-canary'
license=('GPL2')
depends=('shared-mime-info'
         'desktop-file-utils'
         'sdl2'
         'qt5-base'
         'qt5-multimedia'
         'qt5-tools'
         'qt5-wayland'
         'libxkbcommon-x11'
         'ffmpeg'
         'libfdk-aac'
         'libusb')
makedepends=('git' 'cmake' 'python')
source=("$_pkgname::git+https://github.com/citra-emu/citra-canary.git"
        'boost::git+https://github.com/citra-emu/ext-boost.git'
        'git+https://github.com/neobrain/nihstro.git'
        'soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
        'catch::git+https://github.com/philsquared/Catch.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/weidai11/cryptopp.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/lsalzman/enet.git'
        'git+https://github.com/svn2github/inih.git'
        'libressl::git+https://github.com/citra-emu/ext-libressl-portable.git'
        'git+https://github.com/libusb/libusb.git'
        'git+https://github.com/kinetiknz/cubeb.git'
        'git+https://github.com/discordapp/discord-rpc.git'
        'git+https://github.com/arun11299/cpp-jwt.git'
        'git+https://github.com/wwylele/teakra.git'
        'git+https://github.com/lvandeve/lodepng.git'
        'git+https://github.com/facebook/zstd.git'
        # cubeb dependencies
        'git+https://github.com/arsenm/sanitizers-cmake.git')
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

    for submodule in externals/{boost,nihstro,soundtouch,catch,dynarmic,xbyak,cryptopp/cryptopp,fmt,enet,inih/inih,libressl,libusb/libusb,cubeb,discord-rpc,cpp-jwt,teakra,lodepng/lodepng,zstd}; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update
    done

    cd externals/cubeb

    for submodule in cmake/sanitizers-cmake; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update
    done
}

build() {
    cd "$srcdir/$_pkgname"
    
    # Trick the compiler into thinking we're building from a continuous
    # integration tool so the build number is correctly shown in the title
    export CI=true
    export TRAVIS=true
    export TRAVIS_REPO_SLUG=citra-emu/citra-canary
    export TRAVIS_TAG=$(git describe --tags)
    
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/include/libusb-1.0"
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build && cd build
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_QT_TRANSLATION=ON \
      -DCITRA_ENABLE_COMPATIBILITY_REPORTING=ON \
      -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
      -DUSE_DISCORD_PRESENCE=ON \
      -DENABLE_SCRIPTING=ON \
      -DENABLE_FFMPEG_VIDEO_DUMPER=ON \
      -DENABLE_FFMPEG_AUDIO_DECODER=ON
    make
}

check() {
    cd "$srcdir/$_pkgname/build"
    make test
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir/" install
}
