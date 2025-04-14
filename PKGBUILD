# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the chatterino2-7tv-git package (https://aur.archlinux.org/packages/chatterino2-7tv-git)
_pkgname=chatterino7
pkgname=chatterino2-7tv
pkgver=7.5.3
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino"'
arch=('x86_64')
url=https://github.com/SevenTV/chatterino7
license=('MIT')
depends=('hicolor-icon-theme' 'openssl' 'qt6-5compat' 'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('boost' 'cmake' 'git' 'qt6-tools' 'rapidjson')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output')
checkdepends=('httpbin' 'pifpaf')
provides=('chatterino')
conflicts=('chatterino')
install="${pkgname}.install"
source=("git+https://github.com/SevenTV/${_pkgname}.git#tag=v${pkgver}"
        "git+https://github.com/Chatterino/libcommuni.git#commit=2979eb96262756047a8dca47f2e509168138c0d0" # Current chatterino-cmake commit
        "git+https://github.com/Chatterino/websocketpp.git#commit=f1736a8e72b910810ff6869fe20f647a62f3bc35" # Current chatterino commit
        "git+https://github.com/pajlada/settings.git#commit=c141a40d2d493646cd8f0b1e06251a828dfdfdd2" # v0.3.0 release
        "git+https://github.com/pajlada/signals.git#commit=d06770649a7e83db780865d09c313a876bf0f4eb" # v0.1.0 is missing a GCC 14 fix
        "git+https://github.com/pajlada/serialize.git#commit=17946d65a41a72b447da37df6e314cded9650c32"
        "git+https://github.com/Neargye/magic_enum.git#tag=v0.9.7"
        "git+https://github.com/mackron/miniaudio.git#tag=0.11.22"
        "git+https://github.com/ThePhD/sol2.git#tag=v3.3.1"
        "git+https://github.com/arsenm/sanitizers-cmake.git#commit=9689dd8f05e16deb3f3116916109edf2cce6f29a"
        "git+https://github.com/lua/lua.git#tag=v5.4.7")
sha256sums=('966bbdb7e2be8f66648d139bd28f8a7e3333f38c9f8d169f246ffb4edcce442c'
            'd9c6ad75a70f1d8463e8992fbc5ef0d45c78d33c37ede4d572499a607424e764'
            'd50966ad9cccfba81208ed08c2633054050e64ba3f90c8c0c88b5bd07f8d8f0f'
            '862a07e96dea7ab2a8484688add61156b6fb925992489be927b914b898e05204'
            'd2c209441de8e5f7043bb5f57f5efb01d9e3affdf3b293d37a8dc236a6d29f06'
            '2720af5b86830c88c3c18f4760ec13fd3135cb57c4052075644d2423ef9a2076'
            '35e3ccee2fe02c2a666680aa00982e1d6593de440b8be04a04d399dd97c3e78c'
            'ea102d1857e87f6ac56d2c9064e9afabcd3c314965d1ab5d82d52190f58944dc'
            '8bb9a8d32d3ddb6c6aa30daec0c851e7e66758b31cb76c5ba94f334adfc953ba'
            '971b20795b58e27c0f9879fcc3e2a9b578f46d72b25b6f904e7a3149a61f7747'
            '54418e9820f5943c676a8f4be44061c4a9e5e698a5a33c2e856c7b8e1f3735d5')

# We temporarily disable LTO since we get an ICE when compiling with gcc since this commit https://github.com/Chatterino/chatterino2/commit/ed20e71db4c957d3b2a8ce9350b847f4c805cb83
# Bug report tracking https://gcc.gnu.org/bugzilla/show_bug.cgi?id=114501
options=('!lto')

prepare() {
    cd "${_pkgname}"

    git submodule init
    for module in libcommuni settings signals serialize websocketpp magic_enum miniaudio; do
        git config "submodule.lib/${module}.url" "${srcdir}/${module}"
    done
    git config submodule.cmake/sanitizers-cmake.url "${srcdir}/sanitizers-cmake"
    git config submodule.lib/lua/src.url "${srcdir}/lua"
    git config submodule.tools/crash-handler.url "${srcdir}/crash-handler"

    git -c protocol.file.allow=always -c submodule.lib/rapidjson.update=none submodule update
}

build() {
    cmake -S "${_pkgname}" -B build --fresh \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_QTKEYCHAIN=ON \
        -DBUILD_TESTS=ON \
        -DBUILD_WITH_QT6=ON \
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
    DESTDIR="${_pkgdir}" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" "${_pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
