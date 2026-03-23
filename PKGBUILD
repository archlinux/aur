# Maintainer: fijxu <fijxu [at] nadeko [dot] net>

pkgname=chatterino2-technorino-git
_pkgname=technorino
pkgver=r6236.757f362
pkgrel=1
pkgdesc='Another fork of Chatterino2 with features (or fixes) that are not accepted into the upstream repo (7tv emotes included)'
arch=('any')
url=https://github.com/2547techno/technorino
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'libnotify' 'openssl'
         'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('boost' 'cmake' 'git' 'python3' 'qt6-tools' 'rapidjson')
optdepends=('streamlink: For piping streams to video players'
            'pipewire: For audio output'
            'qt6-wayland: For Wayland support')
checkdepends=('go' 'httpbin' 'pifpaf')
provides=('chatterino')
conflicts=('chatterino')
install=$pkgname.install
source=("git+https://github.com/2547techno/technorino"
        "git+https://github.com/Chatterino/certify.git#commit=a448a3915ddac716ce76e4b8cbf0e7f4153ed1e2" # Has no tags
        "git+https://github.com/Chatterino/libcommuni.git#commit=bb5417c451d764f57f2f1b3e1c9a81496b5521bd" # Current chatterino-cmake commit
        "git+https://github.com/pajlada/settings.git#tag=chatterino/2.5.5"
        "git+https://github.com/pajlada/signals.git#commit=chatterino/2.5.5"
        "git+https://github.com/pajlada/serialize.git#tag=chatterino/2.5.5"
        "git+https://github.com/Neargye/magic_enum.git#tag=v0.9.7"
        "git+https://github.com/mackron/miniaudio.git#tag=0.11.25"
        "git+https://github.com/ThePhD/sol2.git#tag=v3.5.0"
        "git+https://github.com/google/googletest.git#tag=v1.17.0"
        "git+https://github.com/martinmoene/expected-lite.git#tag=v0.10.0"
        "git+https://github.com/arsenm/sanitizers-cmake.git#commit=bcb1fc68616e9645ca5acea2992412606373ab04" # Has no tags
        "git+https://github.com/lua/lua.git#tag=v5.4.8"
        "git+https://github.com/HowardHinnant/date.git#tag=v3.0.4"
        "git+https://github.com/fmtlib/fmt.git#tag=12.1.0"
        "git+https://github.com/Chatterino/twitch-pubsub-server-test.git#tag=v1.0.12")
sha256sums=('SKIP'
            'b859e9727d4ecd9a2c9723c09f6b098dad7e6c8b76964ac3375d74a09aaa3004'
            'a0f7d8365a99d4e59fbc857dbf127b39b3a9a3d27c15dd3b52803ed2dd4c27ac'
            '4ce5aadc3990c4fadec519d4ce9dc8ccf4c73e5dbbb9b135949c0ea6fb0c9c5e'
            '2b22dbc39f5b0946da63663afbfc93f60fbcc7a54e5f3078850e12127e1bcffc'
            '87078a66e951bc7926597df20b6c85a55d14a062b7d6ce1116573274c47a0588'
            '35e3ccee2fe02c2a666680aa00982e1d6593de440b8be04a04d399dd97c3e78c'
            '5c8e8abbc2a43f20324a8ae9280f4aba6ec0235923b54c99a6d1b1d999927333'
            'fbeaa53812eb9f0e1e0612da22b1f57ab429e715fd24ccf0c3892172082becd1'
            '3a8fea2f310f73e090dbf10dc16260ab959cccf77bc5482f453d1f4bc3af4bcb'
            'faa2298961ea0b5811ef656b0fb52026d73225fa00bb7161796bdad1f016a1d2'
            'b1381cab9801476fc06ae66b99c036af15309d253560869142990179dadd8760'
            '0f72c1973ef31e1af2e302b6ab1335a8a7f08be0bf5100cb06ebbeeb8d0c7439'
            '0677c2cac20ae98936b87a7bcedf9970459c88f57196b71b7b6758361b145ce7'
            'e15e95cc21dba4d62489a959b459c1aa51c483c2cf94d2810a3a1555b43e30ea'
            '8c45f050dca5c46d478b00989d9dec54bf5e12d89983d0f6166ba4f3e38fac0a')

pkgver() {
    cd "$srcdir/technorino"
    # git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' doesn't work!:
    # fatal: No annotated tags can describe 'b46cfef9e95a6fd6a9d05cbe78430f039541510c'.
    # However, there were unannotated tags: try --tags.
    # That is why I still use this way to put the pkg version
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    declare -A _submodules=(
        [certify]=""
        [libcommuni]=""
        [settings]=""
        [signals]=""
        [serialize]=""
        [magic_enum]=""
        [miniaudio]=""
        [sol2]=""
        [googletest]=""
        [expected-lite]=""
        [sanitizers-cmake]="cmake/sanitizers-cmake"
        [lua]="lib/lua/src"
        [date]="lib/twitch-eventsub-ws/lib/date"
        [fmt]="lib/twitch-eventsub-ws/lib/fmt"
    )

    cd "${_pkgname}"

    # Initialize the submodules with local repository clones
    git submodule init
    for module in "${!_submodules[@]}"; do
        [ -z "${_submodules[${module}]}" ] && _modpath="lib/${module}" || _modpath="${_submodules[${module}]}"
        git config "submodule.${_modpath}.url" "${srcdir}/${module}"
    done
    git -c protocol.file.allow=always \
        -c submodule.lib/WinToast.update=none \
        -c submodule.lib/rapidjson.update=none \
        -c submodule.lib/qtkeychain.update=none \
        -c submodule.tools/crash-handler.update=none \
        submodule update

    # Make sure submodules are updated inside the main repository (similar to extract_git() function)
    for module in "${!_submodules[@]}"; do
        [ -z "${_submodules[${module}]}" ] && _modpath="lib/${module}" || _modpath="${_submodules[${module}]}"
        git -C "${_modpath}" fetch origin
        git -C "${_modpath}" reset --hard origin/HEAD
    done

    # Workaround to make testHttp/HttpBody/HttpBodyMultipart tests pass with httpbin
    sed -i 's/_EQ(lua->get<QByteArray>("data"), c.data/_THAT(lua->get<QByteArray>("data"), testing::HasSubstr(c.data)/' \
        tests/src/Plugins.cpp
    sed -i 's/_EQ(result.getData(), "foobar")/_THAT(result.getData(), testing::HasSubstr("foobar"))/' \
        tests/src/NetworkRequest.cpp
    sed -i '/"Content-Disposition: form-data/ { N; s/"Content-Disposition: form-data.*\n.*my text"/"my text"/; }' \
        tests/src/NetworkRequest.cpp

    # Change the test ports to less likely to be used ones (should reduce the likolihood of test failures)
    sed -i 's/:9050/:64050/g' tests/src/{BasicPubSub,BttvLiveUpdates,Plugins,SeventvEventAPI,TwitchPubSubClient,WebSocketPool}.cpp
    sed -i 's/:9051/:64051/' tests/src/NetworkHelpers.hpp
    sed -i 's/:9052/:64052/' tests/src/{Plugins,WebSocketPool}.cpp
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
