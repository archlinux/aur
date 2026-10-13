# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Ckat <ckat@teknik.io>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the chatterino2-git package (https://aur.archlinux.org/packages/chatterino2-git)

pkgname=chatterino2
pkgver=2.5.6
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino"'
arch=('x86_64')
url=https://chatterino.com
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'hunspell' 'libnotify'
         'openssl' 'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('boost' 'cmake' 'git' 'python3' 'qt6-tools' 'rapidjson')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
checkdepends=('go' 'httpbin' 'pifpaf')
provides=('chatterino')
conflicts=('chatterino')
install="${pkgname}.install"
source=("git+https://github.com/Chatterino/${pkgname}.git#tag=v${pkgver}"
        "git+https://github.com/Chatterino/certify.git#commit=a448a3915ddac716ce76e4b8cbf0e7f4153ed1e2" # Has no tags
        "git+https://github.com/Chatterino/libcommuni.git#commit=ac0e713e5a904b6f3231c70e076f6fd67a78455e" # Last (?) non-breaking chatterino-cmake commit
        "git+https://github.com/pajlada/settings.git#tag=chatterino/2.5.5"
        "git+https://github.com/pajlada/signals.git#commit=chatterino/2.5.5"
        "git+https://github.com/pajlada/serialize.git#tag=chatterino/2.5.5"
        "git+https://github.com/Neargye/magic_enum.git#tag=v0.9.8"
        "git+https://github.com/mackron/miniaudio.git#tag=0.11.25"
        "git+https://github.com/ThePhD/sol2.git#tag=v3.5.0"
        "git+https://github.com/google/googletest.git#tag=v1.18.0"
        "git+https://github.com/martinmoene/expected-lite.git#tag=v0.10.0"
        "git+https://github.com/arsenm/sanitizers-cmake.git#commit=bcb1fc68616e9645ca5acea2992412606373ab04" # Has no tags
        "git+https://github.com/lua/lua.git#tag=v5.4.8"
        "git+https://github.com/HowardHinnant/date.git#tag=v3.0.5"
        "git+https://github.com/fmtlib/fmt.git#tag=12.2.0"
        "git+https://github.com/Chatterino/twitch-pubsub-server-test.git#tag=v1.0.12")
sha256sums=('82634c968aa448a337dfee3f3660ba2353712732ecec2044c9103dfd17cd746c'
            'b859e9727d4ecd9a2c9723c09f6b098dad7e6c8b76964ac3375d74a09aaa3004'
            'ae3c5b5d5a40e25048ee7c42c571a18e48f902c7e6821cba44a4b96a842d01d3'
            '4ce5aadc3990c4fadec519d4ce9dc8ccf4c73e5dbbb9b135949c0ea6fb0c9c5e'
            '2b22dbc39f5b0946da63663afbfc93f60fbcc7a54e5f3078850e12127e1bcffc'
            '87078a66e951bc7926597df20b6c85a55d14a062b7d6ce1116573274c47a0588'
            '8dfa5b66f0ff2fed07ba4b57a63f1942e449979065530f3a48b89c36f1170432'
            '5c8e8abbc2a43f20324a8ae9280f4aba6ec0235923b54c99a6d1b1d999927333'
            'fbeaa53812eb9f0e1e0612da22b1f57ab429e715fd24ccf0c3892172082becd1'
            '080653414b45e6dbe93380c3a65a2c6a6cbf376f9dbc488587c78d73d1b05b77'
            'faa2298961ea0b5811ef656b0fb52026d73225fa00bb7161796bdad1f016a1d2'
            'b1381cab9801476fc06ae66b99c036af15309d253560869142990179dadd8760'
            '0f72c1973ef31e1af2e302b6ab1335a8a7f08be0bf5100cb06ebbeeb8d0c7439'
            'e2a7052757ff4854b21de4f7409c19069ea1996410f820c7e7c4c7f374d07d8b'
            'aaf7dd1183d13e8ce0c4ed988867c8096042e57179d238f6296871774bf6abbd'
            '8c45f050dca5c46d478b00989d9dec54bf5e12d89983d0f6166ba4f3e38fac0a')

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

    cd "${pkgname}"

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
    # Workaround build issue on headless systems
    export QT_QPA_PLATFORM=offscreen

    cmake -S "${pkgname}" -B build --fresh \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_QTKEYCHAIN=ON \
        -DBUILD_TESTS=ON \
        -DCHATTERINO_UPDATER=OFF \
        -DCHATTERINO_PLUGINS=ON \
        -DCHATTERINO_SPELLCHECK=ON \
        -DINSTALL_GTEST=OFF
    cmake --build build
}

check() {
    # Workaround test execution issues on headless systems
    export QT_QPA_PLATFORM=offscreen

    # Compile the PubSub server (TODO: Avoid using Go?)
    pushd twitch-pubsub-server-test
    export GOPATH="${PWD}"
    go mod download -modcacherw
    cd cmd/server
    CGO_ENABLED=0 go build -trimpath -mod=readonly -modcacherw

    # Actually run the tests
    eval `pifpaf run httpbin --port 64051`
    ./server 127.0.0.1:64050 127.0.0.1:64052 &
    popd
    ctest --test-dir build --output-on-failure
    kill %+
    pifpaf_stop
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
