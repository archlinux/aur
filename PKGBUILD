# Maintainer: slch <fijxu <at> zzls <dot> xyz>

pkgname=chatterino2-technorino-git
_pkgname=technorino
pkgver=r4329.aa6d0631
pkgrel=1
pkgdesc='Another fork of Chatterino2 with features (or fixes) that are not accepted into the upstream repo (7tv emotes included)'
arch=('any')
url=https://github.com/2547techno/technorino
license=('MIT')
depends=('qt5-base' 'qt5-tools' 'boost-libs' 'openssl' 'qt5-imageformats' 'qtkeychain-qt5')
makedepends=('git' 'qt5-svg' 'boost' 'cmake')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
provides=('chatterino')
options=('lto')
conflicts=('chatterino2-git' 'chatterino2-appimage' 'chatterino2-nightly-appimage' 'chatterino2-7tv-git' 'chatterino2-dankerino-git')
install=$pkgname.install
source=("avif.patch"
		"git+https://github.com/2547techno/technorino"
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
md5sums=('6dfbc6528311c4a98842462d4eeff0b5'
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
	patch --forward --strip=1 --input="${srcdir}/avif.patch"
    sed -i 's\Icon=com.chatterino.chatterino\Icon=chatterino\g' resources/com.chatterino.chatterino.desktop
    sed -i 's\Version=1.0\Version=7.4.5\g' resources/com.chatterino.chatterino.desktop
    git submodule init
    git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
    git config submodule.lib/libcommuni.url "$srcdir/libcommuni"
    git config submodule.lib/crashpad.url "$srcdir/crashpad"
    # TODO: crashpad contains its own submodules, this needs to be resolved
    # crashpad is currently not used by this build
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
    cd "$srcdir/$_pkgname"
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
        "${flags[@]}" \
        ..
    cmake --build .
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
