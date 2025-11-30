# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Ckat <ckat@teknik.io>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the chatterino2-git package (https://aur.archlinux.org/packages/chatterino2-git)

pkgname=chatterino2
pkgver=2.5.4
pkgrel=5
pkgdesc='Second installment of the Twitch chat client series "Chatterino"'
arch=('x86_64')
url=https://chatterino.com
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'libnotify' 'openssl'
         'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('boost' 'cmake' 'git' 'python3' 'qt6-tools' 'rapidjson')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
checkdepends=('go' 'httpbin' 'pifpaf')
provides=('chatterino')
conflicts=('chatterino')
install="${pkgname}.install"
source=("git+https://github.com/Chatterino/${pkgname}.git#tag=v${pkgver}"
        "git+https://github.com/Chatterino/certify.git#commit=a448a3915ddac716ce76e4b8cbf0e7f4153ed1e2" # Has no tags
        "git+https://github.com/Chatterino/libcommuni.git#commit=bb5417c451d764f57f2f1b3e1c9a81496b5521bd" # Current chatterino-cmake commit
        "git+https://github.com/Chatterino/websocketpp.git#commit=f1736a8e72b910810ff6869fe20f647a62f3bc35" # Current chatterino commit
        "git+https://github.com/pajlada/settings.git#tag=chatterino/2.5.4"
        "git+https://github.com/pajlada/signals.git#commit=a7611f4aa4a37c6c84aabc616657369b0dfd2826" # Has no relevant tags
        "git+https://github.com/pajlada/serialize.git#tag=chatterino/2.5.4"
        "git+https://github.com/Neargye/magic_enum.git#tag=v0.9.7"
        "git+https://github.com/mackron/miniaudio.git#tag=0.11.23"
        "git+https://github.com/ThePhD/sol2.git#tag=v3.5.0"
        "git+https://github.com/google/googletest.git#tag=v1.17.0"
        "git+https://github.com/martinmoene/expected-lite.git#tag=v0.10.0"
        "git+https://github.com/arsenm/sanitizers-cmake.git#commit=bcb1fc68616e9645ca5acea2992412606373ab04" # Has no tags
        "git+https://github.com/lua/lua.git#tag=v5.4.8"
        "git+https://github.com/HowardHinnant/date.git#tag=v3.0.4"
        "git+https://github.com/fmtlib/fmt.git#tag=12.1.0"
        "git+https://github.com/Chatterino/twitch-pubsub-server-test.git#tag=v1.0.12")
sha256sums=('1f71fac4eac80106cacd9ce0bd63a566c25bc9c8f707b3c15c3f0ce879589a17'
            'b859e9727d4ecd9a2c9723c09f6b098dad7e6c8b76964ac3375d74a09aaa3004'
            'a0f7d8365a99d4e59fbc857dbf127b39b3a9a3d27c15dd3b52803ed2dd4c27ac'
            'd50966ad9cccfba81208ed08c2633054050e64ba3f90c8c0c88b5bd07f8d8f0f'
            '38c32aa8909b8bfa85254a0f62658b7142d0ddc67b39746ddbc1ad92d80dfdd0'
            'a75414180aa5377158b5d73e08a4b2a878f616d228fc891a8967093afb20602f'
            '2720af5b86830c88c3c18f4760ec13fd3135cb57c4052075644d2423ef9a2076'
            '35e3ccee2fe02c2a666680aa00982e1d6593de440b8be04a04d399dd97c3e78c'
            '4492cd40ccd70eb4b5ef93ca276a09c9a8755d7e04c6184e408a68dd527ad22c'
            'fbeaa53812eb9f0e1e0612da22b1f57ab429e715fd24ccf0c3892172082becd1'
            '3a8fea2f310f73e090dbf10dc16260ab959cccf77bc5482f453d1f4bc3af4bcb'
            'faa2298961ea0b5811ef656b0fb52026d73225fa00bb7161796bdad1f016a1d2'
            'b1381cab9801476fc06ae66b99c036af15309d253560869142990179dadd8760'
            '0f72c1973ef31e1af2e302b6ab1335a8a7f08be0bf5100cb06ebbeeb8d0c7439'
            '0677c2cac20ae98936b87a7bcedf9970459c88f57196b71b7b6758361b145ce7'
            'e15e95cc21dba4d62489a959b459c1aa51c483c2cf94d2810a3a1555b43e30ea'
            '8c45f050dca5c46d478b00989d9dec54bf5e12d89983d0f6166ba4f3e38fac0a')

prepare() {
    declare -A _submodules=(
        [certify]=""
        [libcommuni]=""
        [websocketpp]=""
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

    # Remove Qt 5 compat requirement (TODO: Remove this after next Chatterino update)
    git cherry-pick c5ced77f9bb54dcc1cb29e863a7c7c55db9ac786 || true
    git restore -WS CHANGELOG.md
    git commit --no-edit

    # Workaround to make testHttp test pass with httpbin
    sed -i 's/_EQ(lua->get<QByteArray>("data"), c.data/_THAT(lua->get<QByteArray>("data"), testing::HasSubstr(c.data)/' \
        tests/src/Plugins.cpp

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
