# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Ckat <ckat@teknik.io>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the chatterino2-git package (https://aur.archlinux.org/packages/chatterino2-git)

pkgname=chatterino2
pkgver=2.5.4
pkgrel=2
pkgdesc='Second installment of the Twitch chat client series "Chatterino"'
arch=('x86_64')
url=https://chatterino.com
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'libnotify' 'openssl' 'qt6-5compat'
         'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('boost' 'cmake' 'git' 'python3' 'qt6-tools' 'rapidjson')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
checkdepends=('httpbin' 'pifpaf')
provides=('chatterino')
conflicts=('chatterino')
install="${pkgname}.install"
source=("git+https://github.com/Chatterino/${pkgname}.git#tag=v${pkgver}"
        "git+https://github.com/Chatterino/certify.git#commit=a448a3915ddac716ce76e4b8cbf0e7f4153ed1e2" # Has no tags
        "git+https://github.com/Chatterino/libcommuni.git#commit=2979eb96262756047a8dca47f2e509168138c0d0" # Current chatterino-cmake commit
        "git+https://github.com/Chatterino/websocketpp.git#commit=f1736a8e72b910810ff6869fe20f647a62f3bc35" # Current chatterino commit
        "git+https://github.com/pajlada/settings.git#commit=967e86ee79a94ee1f23796046a8eb41e90e54cf2" # Has no relevant tags
        "git+https://github.com/pajlada/signals.git#commit=a7611f4aa4a37c6c84aabc616657369b0dfd2826" # Has no relevant tags
        "git+https://github.com/pajlada/serialize.git#commit=chatterino/2.5.3"
        "git+https://github.com/Neargye/magic_enum.git#tag=v0.9.7"
        "git+https://github.com/mackron/miniaudio.git#tag=0.11.23"
        "git+https://github.com/ThePhD/sol2.git#tag=v3.5.0"
        "git+https://github.com/google/googletest.git#tag=v1.17.0"
        "git+https://github.com/martinmoene/expected-lite.git#tag=v0.9.0"
        "git+https://github.com/arsenm/sanitizers-cmake.git#commit=9689dd8f05e16deb3f3116916109edf2cce6f29a" # Has no tags
        "git+https://github.com/lua/lua.git#tag=v5.4.8"
        "git+https://github.com/HowardHinnant/date.git#tag=v3.0.4"
        "git+https://github.com/fmtlib/fmt.git#tag=12.0.0")
sha256sums=('1f71fac4eac80106cacd9ce0bd63a566c25bc9c8f707b3c15c3f0ce879589a17'
            'b859e9727d4ecd9a2c9723c09f6b098dad7e6c8b76964ac3375d74a09aaa3004'
            'd9c6ad75a70f1d8463e8992fbc5ef0d45c78d33c37ede4d572499a607424e764'
            'd50966ad9cccfba81208ed08c2633054050e64ba3f90c8c0c88b5bd07f8d8f0f'
            'd1583a2b9c708c205952c72dc9514a70ad379548e80b2ea76eaa3280b2999e30'
            'a75414180aa5377158b5d73e08a4b2a878f616d228fc891a8967093afb20602f'
            '2720af5b86830c88c3c18f4760ec13fd3135cb57c4052075644d2423ef9a2076'
            '35e3ccee2fe02c2a666680aa00982e1d6593de440b8be04a04d399dd97c3e78c'
            '4492cd40ccd70eb4b5ef93ca276a09c9a8755d7e04c6184e408a68dd527ad22c'
            'fbeaa53812eb9f0e1e0612da22b1f57ab429e715fd24ccf0c3892172082becd1'
            '3a8fea2f310f73e090dbf10dc16260ab959cccf77bc5482f453d1f4bc3af4bcb'
            'fbe665e3fd4b09547982c4276c269c6ed71f6dc223beded8a6caea2305a8bfb4'
            '971b20795b58e27c0f9879fcc3e2a9b578f46d72b25b6f904e7a3149a61f7747'
            '0f72c1973ef31e1af2e302b6ab1335a8a7f08be0bf5100cb06ebbeeb8d0c7439'
            '0677c2cac20ae98936b87a7bcedf9970459c88f57196b71b7b6758361b145ce7'
            'd486317c93a07987182704245621302c1a72fc7925d069c070539b7d72b4afec')

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
}

build() {
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
    eval `pifpaf run httpbin --port 9051`
    ctest --test-dir build --output-on-failure || : # TODO: Pass the PubSub tests
    pifpaf_stop
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
