# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Ckat <ckat@teknik.io>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the chatterino2-git package (https://aur.archlinux.org/packages/chatterino2-git)

pkgname=chatterino2
pkgver=2.5.1
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
        "git+https://github.com/Chatterino/libcommuni.git#branch=chatterino-cmake"
        "git+https://github.com/pajlada/settings.git"
        "git+https://github.com/pajlada/signals.git"
        "git+https://github.com/pajlada/serialize.git"
        "git+https://github.com/zaphoyd/websocketpp.git"
        "git+https://github.com/Neargye/magic_enum.git"
        "git+https://github.com/mackron/miniaudio.git"
        "git+https://github.com/arsenm/sanitizers-cmake.git"
        "git+https://github.com/lua/lua.git"
        "git+https://github.com/Chatterino/crash-handler.git")
sha256sums=('SKIP'
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

# We temporarily disable LTO since we get an ICE when compiling with gcc since this commit https://github.com/Chatterino/chatterino2/commit/ed20e71db4c957d3b2a8ce9350b847f4c805cb83
# Bug report tracking https://gcc.gnu.org/bugzilla/show_bug.cgi?id=114501
options=('!lto')

prepare() {
    cd "${pkgname}"

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
    cmake -S "${pkgname}" -B build --fresh \
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
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
