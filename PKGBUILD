# Maintainer: Ckat <ckat@teknik.io>
pkgname=chatterino2-git
_pkgname=chatterino2
pkgver=v2.4.1.r5.g7e005ba66
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino", dev/git version'
arch=('any')
url=https://chatterino.com
license=('MIT')
depends=('qt5-base' 'qt5-tools' 'boost-libs' 'openssl' 'qt5-imageformats' 'qtkeychain-qt5')
makedepends=('git' 'qt5-svg' 'boost' 'cmake')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
provides=('chatterino')
conflicts=('chatterino')
install=$pkgname.install
source=("git+https://github.com/Chatterino/chatterino2"
        "git+https://github.com/arsenm/sanitizers-cmake"
        "git+https://github.com/Chatterino/libcommuni#branch=chatterino-cmake"
        "git+https://github.com/getsentry/crashpad"
        "git+https://github.com/pajlada/settings"
        "git+https://github.com/pajlada/signals"
        "git+https://github.com/pajlada/serialize"
        "git+https://github.com/Tencent/rapidjson"
        "git+https://github.com/zaphoyd/websocketpp"
        "git+https://github.com/Neargye/magic_enum"
        "git+https://github.com/mackron/miniaudio")
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
         'SKIP')

pkgver() {
    cd "$srcdir/chatterino2"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare () {
    cd "$srcdir/$_pkgname"
    git submodule init
    git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
    git config submodule.lib/libcommuni.url "$srcdir/libcommuni"
    git config submodule.lib/crashpad.url "$srcdir/crashpad"
    # TODO: crashpad contains its own submodules, this needs to be resolved
    git config submodule.lib/settings.url "$srcdir/settings"
    git config submodule.lib/signals.url "$srcdir/signals"
    git config submodule.lib/serialize.url "$srcdir/serialize"
    git config submodule.lib/rapidjson.url "$srcdir/rapidjson"
    git config submodule.lib/websocketpp.url "$srcdir/websocketpp"
    git config submodule.lib/miniaudio.url "$srcdir/miniaudio"
    git config submodule.lib/magicenum.url "$srcdir/magicenum"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/chatterino2"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_SYSTEM_QTKEYCHAIN=ON \
        -DUSE_PRECOMPILED_HEADERS=OFF \
        ..
    make
}

package() {
    cd "$srcdir/chatterino2"
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
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/chatterino.png"
}
