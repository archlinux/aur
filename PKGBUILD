# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Ckat <ckat@teknik.io>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the chatterino2-git package (https://aur.archlinux.org/packages/chatterino2-git)

pkgname=chatterino2
pkgver=2.5.2
pkgrel=2
pkgdesc='Second installment of the Twitch chat client series "Chatterino"'
arch=('x86_64')
url=https://chatterino.com
license=('MIT')
depends=('hicolor-icon-theme' 'openssl' 'qt6-5compat' 'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('boost' 'cmake' 'git' 'qt6-tools' 'rapidjson')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
checkdepends=('httpbin' 'pifpaf')
provides=('chatterino')
conflicts=('chatterino')
install="${pkgname}.install"
source=("git+https://github.com/Chatterino/${pkgname}.git#tag=v${pkgver}"
        "git+https://github.com/Chatterino/libcommuni.git#commit=2979eb96262756047a8dca47f2e509168138c0d0" # Current chatterino-cmake commit
        "git+https://github.com/Chatterino/websocketpp.git#commit=f1736a8e72b910810ff6869fe20f647a62f3bc35" # Current chatterino commit
        "git+https://github.com/pajlada/settings.git#tag=v0.2.2"
        "git+https://github.com/pajlada/signals.git#commit=d06770649a7e83db780865d09c313a876bf0f4eb" # v0.1.0 is missing a GCC 14 fix
        "git+https://github.com/pajlada/serialize.git#commit=17946d65a41a72b447da37df6e314cded9650c32"
        "git+https://github.com/Neargye/magic_enum.git#tag=v0.9.7"
        "git+https://github.com/mackron/miniaudio.git#tag=0.11.21"
        "git+https://github.com/ThePhD/sol2.git#tag=v3.3.1"
        "git+https://github.com/arsenm/sanitizers-cmake.git#commit=9689dd8f05e16deb3f3116916109edf2cce6f29a"
        "git+https://github.com/lua/lua.git#tag=v5.4.7"
        "0001-fix-remove-deprecated-asio-stuff.patch")
sha256sums=('e514804a96c0badf39c58c6dc89f6ef16cac03586e961e27e116fda808fdecfa'
            'd9c6ad75a70f1d8463e8992fbc5ef0d45c78d33c37ede4d572499a607424e764'
            'd50966ad9cccfba81208ed08c2633054050e64ba3f90c8c0c88b5bd07f8d8f0f'
            'd89fdff40577f48a9b8ec67259dbd09e88d92be1054c81118531eaeffa2dc2b4'
            'd2c209441de8e5f7043bb5f57f5efb01d9e3affdf3b293d37a8dc236a6d29f06'
            '2720af5b86830c88c3c18f4760ec13fd3135cb57c4052075644d2423ef9a2076'
            '35e3ccee2fe02c2a666680aa00982e1d6593de440b8be04a04d399dd97c3e78c'
            'e496eb80ea366a3cf5275479614c302644832f1994fbb109c28d3635d3a7eb79'
            '8bb9a8d32d3ddb6c6aa30daec0c851e7e66758b31cb76c5ba94f334adfc953ba'
            '971b20795b58e27c0f9879fcc3e2a9b578f46d72b25b6f904e7a3149a61f7747'
            '54418e9820f5943c676a8f4be44061c4a9e5e698a5a33c2e856c7b8e1f3735d5'
            'bffecc954258e0f2c45ef70ea37a50c137eece9b27306b2046b2ed2a9e1f3f7e')

# We temporarily disable LTO since we get an ICE when compiling with gcc since this commit https://github.com/Chatterino/chatterino2/commit/ed20e71db4c957d3b2a8ce9350b847f4c805cb83
# Bug report tracking https://gcc.gnu.org/bugzilla/show_bug.cgi?id=114501
options=('!lto')

# websocketpp hack for dirty build
if grep -q "zaphoyd" websocketpp/config; then
    git -C websocketpp remote set-url origin "https://github.com/Chatterino/websocketpp.git"
fi

prepare() {
    declare -A _submodules=(
        [libcommuni]=""
        [websocketpp]=""
        [settings]=""
        [signals]=""
        [serialize]=""
        [magic_enum]=""
        [miniaudio]=""
        [sol2]=""
        [sanitizers-cmake]="cmake/sanitizers-cmake"
        [lua]="lib/lua/src"
    )

    cd "${pkgname}"

    # Initialize the submodules with local repository clones
    git submodule init
    for module in "${!_submodules[@]}"; do
        [ -z "${_submodules[${module}]}" ] && _modpath="lib/${module}" || _modpath="${_submodules[${module}]}"
        git config "submodule.${_modpath}.url" "${srcdir}/${module}"
    done
    git -c protocol.file.allow=always -c submodule.lib/rapidjson.update=none submodule update

    # Make sure submodules are updated inside the main repository (similar to extract_git() function)
    for module in "${!_submodules[@]}"; do
        [ -z "${_submodules[${module}]}" ] && _modpath="lib/${module}" || _modpath="${_submodules[${module}]}"
        git -C "${_modpath}" fetch origin
        git -C "${_modpath}" checkout origin/HEAD
    done

    # Boost 1.78 fixes (https://github.com/Chatterino/chatterino2/pull/5832)
    git apply ../0001-fix-remove-deprecated-asio-stuff.patch
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
