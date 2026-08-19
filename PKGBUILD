# Maintainer: Bryan
pkgname=slopengine
pkgver=0.5.0
pkgrel=1
pkgdesc="First-person boomer shooter game engine (raylib/flecs/s7)"
arch=('x86_64')
url="https://github.com/slopnode/engine"
license=('MIT')
options=('!debug')
depends=(
    'glu'
    'libglvnd'
    'libsm'
    'libice'
    'libx11'
    'libxext'
    'libxcb'
    'libxau'
    'libxdmcp'
    'util-linux-libs'
    'wayland'
    'libxkbcommon'
)
makedepends=('cmake' 'git' 'pkgconf' 'patchelf')

_commit=ac5920a1eb599db67ccee086423a86c285948197
_steamaudio_ver=4.8.1

source=(
    "$pkgname::git+https://github.com/slopnode/engine.git#commit=${_commit}"
    "steamaudio-${_steamaudio_ver}.zip::https://github.com/ValveSoftware/steam-audio/releases/download/v${_steamaudio_ver}/steamaudio_${_steamaudio_ver}.zip"
)
sha256sums=('SKIP'
            '4a0aa5ec1176f38f0b0993a37c2259d9e86f27e22d5e24f83ec4c3cb9a1d5449')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"
    local search_paths="${HOME}/.local/share/slopengine/packages;/usr/share/slopengine/packages"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSLOPENGINE_USE_STEAM_AUDIO=ON \
        -DSTEAM_AUDIO_ROOT="$srcdir/steamaudio" \
        -DSLOPENGINE_ENGINE_PACKAGE_DIR=/usr/share/slopengine/packages/engine \
        -DSLOPENGINE_APP_SEARCH_PATHS="$search_paths"
    cmake --build build -j"$(nproc)"
}

package() {
    cd "$pkgname"
    for bin in slopengine sloprepl slopbsp sloprad slopfac slopvis \
               slopmap slopsprite slopthing sloplauncher slopicons; do
        install -Dm755 "build/$bin" "$pkgdir/usr/bin/$bin"
    done
    install -Dm644 "$srcdir/steamaudio/lib/linux-x64/libphonon.so" \
        "$pkgdir/usr/lib/slopengine/libphonon.so"
    patchelf --set-rpath /usr/lib/slopengine "$pkgdir/usr/bin/slopengine"
    install -d "$pkgdir/usr/share/slopengine/packages"
    cp -a packages/engine "$pkgdir/usr/share/slopengine/packages/engine"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
