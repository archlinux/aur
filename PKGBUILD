# Maintainer: Ckat <ckat@teknik.io>
pkgname=chatterino2-git
_pkgname=chatterino2
pkgver=v2.4.0.r99.g56adaf81a
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
        "git+https://github.com/Chatterino/libcommuni#branch=chatterino-cmake"
        "git+https://github.com/jiakuan/qBreakpad"
        "git+https://github.com/mohabouje/WinToast"
        "git+https://github.com/pajlada/settings"
        "git+https://github.com/pajlada/signals"
        "git+https://github.com/pajlada/serialize"
        "git+https://github.com/Tencent/rapidjson"
        "git+https://github.com/arsenm/sanitizers-cmake"
        "git+https://github.com/zaphoyd/websocketpp"
        "git+https://github.com/Neargye/magic_enum"
        "git+https://github.com/mackron/miniaudio"
        "git+https://github.com/google/googletest.git")
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
    git config submodule.libcommuni $srcdir/$_pkgname/lib/libcommuni
    git config submodule.qBreakpad $srcdir/$_pkgname/lib/qBreakpad
    git config submodule.WinToast $srcdir/$_pkgname/lib/WinToast
    git config submodule.settings $srcdir/$_pkgname/lib/settings
    git config submodule.signals $srcdir/$_pkgname/lib/signals
    git config submodule.serialize $srcdir/$_pkgname/lib/serialize
    git config submodule.rapidjson $srcdir/$_pkgname/lib/rapidjson
    git config submodule.sanitizers-cmake $srcdir/$_pkgname/lib/sanitizers-cmake
    git config submodule.websocketpp $srcdir/$_pkgname/lib/websocketpp
    git config submodule.miniaudio $srcdir/$_pkgname/lib/miniaudio
    git config submodule.magicenum $srcdir/$_pkgname/lib/magic_enum
    git config submodule.googletest $srcdir/$_pkgname/lib/googletest
    git submodule update
}

build() {
    cd "$srcdir/chatterino2"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_QTKEYCHAIN=ON ..
    if [ -z "$CCACHE_SLOPPINESS" ]; then
        # We need to set the ccache sloppiness for the chatterino build to use it properly
        # This is due to our use of precompiled headers
        # See https://ccache.dev/manual/3.3.5.html#_precompiled_headers
        CCACHE_SLOPPINESS="pch_defines,time_macros"
        export CCACHE_SLOPPINESS
    fi
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
