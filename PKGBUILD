# Maintainer: fijxu <fijxu [at] nadeko [dot] net>

pkgname=chatterino2-technorino-git
_pkgname=technorino
pkgver=r5181.b46cfef
pkgrel=1
pkgdesc='Another fork of Chatterino2 with features (or fixes) that are not accepted into the upstream repo (7tv emotes included)'
arch=('any')
url=https://github.com/2547techno/technorino
license=('MIT')
depends=('qt6-base' 'qt6-tools' 'boost-libs' 'openssl' 'qt6-imageformats' 'qtkeychain-qt6' 'qt6-5compat' 'qt6-svg')
makedepends=('git' 'boost' 'cmake')
optdepends=('streamlink: For piping streams to video players'
            'pipewire: For audio output'
            'qt6-wayland: For Wayland support')
provides=('chatterino')
conflicts=('chatterino')
install=$pkgname.install
source=("git+https://github.com/2547techno/technorino"
        "git+https://github.com/arsenm/sanitizers-cmake"
        "git+https://github.com/Chatterino/libcommuni#branch=chatterino-cmake"
        "git+https://github.com/pajlada/settings"
        "git+https://github.com/pajlada/signals"
        "git+https://github.com/pajlada/serialize"
        "git+https://github.com/Tencent/rapidjson"
        "git+https://github.com/Chatterino/websocketpp"
        "git+https://github.com/Neargye/magic_enum"
        "git+https://github.com/mackron/miniaudio"
        "git+https://github.com/lua/lua"
        "git+https://github.com/martinmoene/expected-lite"
        "git+https://github.com/Chatterino/crash-handler")
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
         'SKIP')
# We temporarily disable LTO since we get an ICE when compiling with gcc since this commit https://github.com/Chatterino/chatterino2/commit/ed20e71db4c957d3b2a8ce9350b847f4c805cb83
# Bug report tracking https://gcc.gnu.org/bugzilla/show_bug.cgi?id=114501
options=('!lto')

pkgver() {
    cd "$srcdir/technorino"
    # git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' doesn't work!:
    # fatal: No annotated tags can describe 'b46cfef9e95a6fd6a9d05cbe78430f039541510c'.
    # However, there were unannotated tags: try --tags.
    # That is why I still use this way to put the pkg version
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare () {
    cd "$srcdir/technorino"
    # Disable updating of unused submodules
    git config submodule.lib/googletest.update "none"
    git config submodule.lib/WinToast.update "none"
    git config submodule.lib/qtkeychain.update "none"
    git submodule init
    git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
    git config submodule.lib/libcommuni.url "$srcdir/libcommuni"
    git config submodule.lib/settings.url "$srcdir/settings"
    git config submodule.lib/signals.url "$srcdir/signals"
    git config submodule.lib/serialize.url "$srcdir/serialize"
    git config submodule.lib/rapidjson.url "$srcdir/rapidjson"
    git config submodule.lib/websocketpp.url "$srcdir/websocketpp"
    git config submodule.lib/miniaudio.url "$srcdir/miniaudio"
    git config submodule.lib/magicenum.url "$srcdir/magicenum"
    git config submodule.lib/lua/src.url "$srcdir/lua"
    git config submodule.lib/expected-lite.url "$srcdir/expected-lite"
    git config submodule.tools/crash-handler.url "$srcdir/crash-handler"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/technorino"
    mkdir -p build
    cd build
    declare -a flags
    if [[ $CXXFLAGS == *"-flto"* ]]; then
        flags+=("-DCHATTERINO_LTO=ON")
    fi
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_SYSTEM_QTKEYCHAIN=ON \
        -DUSE_PRECOMPILED_HEADERS=OFF \
        -DBUILD_WITH_QT6=ON \
        -DCHATTERINO_UPDATER=OFF \
        -DCHATTERINO_PLUGINS=ON \
        "${flags[@]}" \
        ..
    cmake --build .
}

package() {
    cd "$srcdir/technorino"
    if [ -f "build/bin/chatterino" ] && [ -x "build/bin/chatterino" ]; then
        echo "Getting chatterino binary from bin folder"
        install -Dm755 "build/bin/chatterino" "$pkgdir/usr/bin/chatterino"
    else
        echo "Getting chatterino binary from NON-BIN folder"
        # System ccache is enabled, causing the binary file to not fall into the bin folder
        # Temporary solution until we have figured out a way to stabilize the ccache output
        install -Dm755 "build/chatterino" "$pkgdir/usr/bin/chatterino"
    fi
    install -Dm644 "resources/com.chatterino.chatterino.desktop" "$pkgdir/usr/share/applications/com.chatterino.chatterino.desktop"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/com.chatterino.chatterino.png"
}
