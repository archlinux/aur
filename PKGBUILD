# Maintainer: ismail-bahloul <iswadlillah@gmail.com>

# TuxMix — Open-source TotalMix replacement for RME audio interfaces on Linux
#
# Building from source requires Rust (cargo) and ALSA development headers.
#
# When a new version is tagged on GitHub, update pkgver and the source
# tarball checksum below.

pkgname=tuxmix
pkgver=0.1.0
pkgrel=2
pkgdesc="Open-source TotalMix replacement for RME audio interfaces on Linux"
arch=('x86_64')
url="https://github.com/ismail-bahloul/TuxMix"
# The application crates are MIT, but tuxmix-gui links tuxmix-usb
# (GPL-3.0-or-later) and tuxmix-sys (GPL-3.0), so the binaries this
# package installs are GPL-3.0 as a whole. See the repo's LICENSE.
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
#
# The three icon files are carried here instead of being taken from the
# archive: v0.1.0 was tagged before the icon was redrawn, so its tree
# still holds the placeholder that first release shipped, and pkgrel
# exists exactly for this — packaging changes over unchanged binaries.
# Drop them, and the ${srcdir} paths in package() below, at the next
# version, where the archive brings all of it back.
source=("${url}/archive/v${pkgver}/TuxMix-${pkgver}.tar.gz"
        "tuxmix.svg"
        "tuxmix-128.png"
        "tuxmix-256.png")
sha256sums=('62fc554fe8768295ce141cb344a5ca15cf1e03d925e51841071dc05135457bbc'
            '7e9931e9ee8231de8ff3b7754767270297f22535fe9079742508bb69d1c7a6ee'
            '597010272ea72ea330477d06286e31d5efd7a6a7164123b3dbba48dc8bae95ec'
            '2bda7026de88b9c52c891b03be53ee787c474fe2c77e87bb971faab67b14495c')

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
    install -Dm644 "${srcdir}/tuxmix.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tuxmix.svg"
    install -Dm644 "${srcdir}/tuxmix-128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tuxmix.png"
    install -Dm644 "${srcdir}/tuxmix-256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tuxmix.png"

    install -Dm644 "README.md" \
        "${pkgdir}/usr/share/doc/tuxmix/README.md"
}
