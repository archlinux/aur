# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname='radae-decoder-git'
pkgver='r108.940d4e5'
pkgrel='1'
pkgdesc='FreeDV RADEv1 decoder/encoder with GUI (RADAE_Gui) and CLI tools including webrx_rade_decode'
arch=('x86_64' 'aarch64')
url='https://github.com/peterbmarks/radae_decoder'
license=('BSD-2-Clause')
depends=('gtk3' 'hamlib' 'libpulse')
makedepends=('git' 'cmake')
provides=('radae-decoder')
conflicts=('radae-decoder')
# NOTE: This package requires internet access during the build.
# Two dependencies are fetched at cmake configure/build time:
#   1. A custom Opus fork (with OSCE/DRED neural extensions) via ExternalProject_Add
#      in cmake/BuildOpus.cmake — downloaded from GitHub as a zip archive.
#   2. IXWebSocket v11.4.4 (GUI WebSocket layer) via FetchContent from GitHub.
# Both are bundled into the final binaries (no runtime .so deps added).
#
# Ideally these should be declared in source=() and their network access suppressed
# via -DOPUS_URL=file://... and -DFETCHCONTENT_SOURCE_DIR_IXWEBSOCKET=...,
# but ExternalProject_Add and FetchContent each have subtleties that make
# reliable offline patching complex (ExternalProject ignores file:// on some cmake
# versions; FetchContent GIT_REPOSITORY mode cannot be trivially redirected to a
# tarball without patching the upstream CMakeLists.txt).
# This is a known packaging wart and should be fixed properly in the future.
source=(
    'radae_decoder::git+https://github.com/peterbmarks/radae_decoder.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd radae_decoder
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    # Internet access required during this step — see comments above source=().
    cmake \
        -B build \
        -S radae_decoder \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_GUI=ON
    cmake --build build --parallel
}

package() {
    # CLI tools
    install -Dm755 build/tools/webrx_rade_decode "${pkgdir}/usr/bin/webrx_rade_decode"
    install -Dm755 build/tools/radae_headless    "${pkgdir}/usr/bin/radae_headless"
    install -Dm755 build/tools/rade_demod        "${pkgdir}/usr/bin/rade_demod"
    install -Dm755 build/tools/rade_modulate     "${pkgdir}/usr/bin/rade_modulate"
    install -Dm755 build/tools/radae_tx          "${pkgdir}/usr/bin/radae_tx"
    install -Dm755 build/tools/radae_rx          "${pkgdir}/usr/bin/radae_rx"
    install -Dm755 build/tools/real2iq           "${pkgdir}/usr/bin/real2iq"
    install -Dm755 build/tools/lpcnet_demo       "${pkgdir}/usr/bin/lpcnet_demo"

    # GUI binary
    install -Dm755 build/RADAE_Gui "${pkgdir}/usr/bin/RADAE_Gui"

    # Desktop entry and icon
    install -Dm644 radae_decoder/appimage/RADAE_Gui.desktop \
        "${pkgdir}/usr/share/applications/RADAE_Gui.desktop"
    install -Dm644 radae_decoder/appimage/freedv256x256.png \
        "${pkgdir}/usr/share/pixmaps/freedv256x256.png"

    # License
    install -Dm644 radae_decoder/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
