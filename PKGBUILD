# Maintainer: slch <slch000@pm.me>

pkgname=chatterino2-dankerino-git
_pkgname=dankerino
pkgver=r3813.37191909
pkgrel=1
pkgdesc='A fork of Chatterino2 with features (or fixes) that are not accepted into the upstream repo (7tv emotes included)'
arch=('any')
url=https://github.com/Mm2PL/dankerino
license=('MIT')
depends=('qt5-multimedia' 'qt5-base' 'qt5-tools' 'qt5-imageformats' 'boost-libs' 'openssl')
makedepends=('git' 'qt5-svg' 'boost' 'cmake')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=('chatterino')
conflicts=('chatterino2-git' 'chatterino2-appimage' 'chatterino2-nightly-appimage' 'chatterino2-7tv-git')
install=$pkgname.install
source=("git+https://github.com/Mm2PL/dankerino"
        "git+https://github.com/Chatterino/libcommuni#branch=chatterino-cmake"
        "git+https://github.com/jiakuan/qBreakpad"
        "git+https://github.com/mohabouje/WinToast"
        "git+https://github.com/pajlada/settings"
        "git+https://github.com/pajlada/signals"
        "git+https://github.com/pajlada/serialize"
        "git+https://github.com/Tencent/rapidjson"
        "git+https://github.com/Chatterino/qtkeychain"
        "git+https://github.com/arsenm/sanitizers-cmake"
        "git+https://github.com/zaphoyd/websocketpp"
        "git+https://github.com/Neargye/magic_enum"
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
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    git config submodule.qtkeychain $srcdir/$_pkgname/lib/qtkeychain
    git config submodule.sanitizers-cmake $srcdir/$_pkgname/lib/sanitizers-cmake
    git config submodule.websocketpp $srcdir/$_pkgname/lib/websocketpp
    # We can't set the local directory of this submodule as we have no way of accessing the config name `submodule.magic_enum` because underscores are actually not allowed.
    # The only thing I can think of is moving the submodule to `lib/magicenum` but that feels like an off approach. I'll look into it only if builds fail because of the below call is missing.
    # git config submodule.magic_enum $srcdir/$_pkgname/lib/magic_enum
    git config submodule.googletest $srcdir/$_pkgname/lib/googletest
    git submodule update
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
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
    cd "$srcdir/$_pkgname"
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
