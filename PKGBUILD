# Maintainer: iswad-lab <iswad@lab.dev>

# TuxMix — Open-source TotalMix replacement for RME audio interfaces on Linux
#
# Building from source requires Rust (cargo) and ALSA development headers.
#
# When a new version is tagged on GitHub, update pkgver and the source
# tarball checksum below.

pkgname=tuxmix
pkgver=0.1.0
pkgrel=1
pkgdesc="Open-source TotalMix replacement for RME audio interfaces on Linux"
arch=('x86_64')
url="https://github.com/ismail-bahloul/TuxMix"
license=('GPL3')
depends=(
    'alsa-lib'
    'libgl'
    'systemd-libs'
)
makedepends=(
    'cargo'
)
# tuxmix-usb vendors and compiles libusb from C source (rusb's
# "vendored" feature — no runtime libusb dependency needed as a
# result). makepkg's default LTO CFLAGS break that vendored build
# (mixes LTO bitcode objects into a non-LTO Rust link, ending in
# "undefined symbol: libusb_*" — reproduced and confirmed locally):
# disable LTO for this package specifically.
options=('!lto')
# GitHub names the archive after the repo's real casing (TuxMix-*),
# not the lowercase pkgname — build()/package() cd into that below.
source=("${url}/archive/v${pkgver}/TuxMix-${pkgver}.tar.gz")
sha256sums=('62fc554fe8768295ce141cb344a5ca15cf1e03d925e51841071dc05135457bbc')

build() {
    cd "${srcdir}/TuxMix-${pkgver}"
    cargo build --release --workspace
}

package() {
    cd "${srcdir}/TuxMix-${pkgver}"

    install -Dm755 "target/release/tuxmix-gui" \
        "${pkgdir}/usr/bin/tuxmix"
    install -Dm755 "target/release/tuxmix-tui" \
        "${pkgdir}/usr/bin/tuxmix-tui"

    install -Dm644 "tuxmix-gui/assets/tuxmix.desktop" \
        "${pkgdir}/usr/share/applications/tuxmix.desktop"
    install -Dm644 "tuxmix-gui/assets/tuxmix.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tuxmix.svg"
    install -Dm644 "tuxmix-gui/assets/tuxmix-128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tuxmix.png"
    install -Dm644 "tuxmix-gui/assets/tuxmix-256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tuxmix.png"

    install -Dm644 "README.md" \
        "${pkgdir}/usr/share/doc/tuxmix/README.md"
}
