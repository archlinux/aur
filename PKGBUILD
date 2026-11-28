# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
#
# Builds the release tarball of the tag v${pkgver} and installs the
# window (the command line tool is the bose-connect-cli package):
#   - /usr/bin/bose-connect-gui (the GTK 4 + libadwaita window)
#   - /usr/share/applications/com.airvzxf.bose-connect-gui.desktop
#   - /usr/share/metainfo/com.airvzxf.bose-connect-gui.metainfo.xml
#   - /usr/share/icons/hicolor/{scalable,symbolic}/apps/...
#   - /usr/share/bash-completion/completions/bose-connect-gui
#
# Test locally from this directory: `makepkg -si`.
# After changing this file: `makepkg --printsrcinfo > .SRCINFO`.

pkgname=bose-connect-gui
pkgver=0.8.0
pkgrel=1
pkgdesc="Control Bose Bluetooth headphones and speakers (GTK 4 window)"
arch=('x86_64' 'aarch64')
url="https://github.com/airvzxf/bose-connect-app-linux"
license=('AGPL-3.0-or-later')
depends=(
    'bluez'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk4>=1:4.22'
    'libadwaita>=1:1.9'
)
makedepends=('cargo')
optdepends=(
    'libpulse: restart the audio stream after a party-mode change (pactl)'
    'wireplumber: 44.1 kHz for Bluetooth speakers in party mode'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('115c6625bfd74c48cf889b30fd268a6fffc511a2eb09ccce7c45cc7d5da0e430')

_srcdir="bose-connect-app-linux-${pkgver}"

prepare() {
    cd "${_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release \
        -p bose-connect-gui
}

check() {
    cd "${_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release \
        -p bose-connect -p bose-connect-gui
}

package() {
    cd "${_srcdir}"
    local linux=packaging/linux

    install -Dm755 target/release/bose-connect-gui -t "${pkgdir}/usr/bin/"

    install -Dm644 "${linux}/desktop/bose-connect-gui.desktop" \
        "${pkgdir}/usr/share/applications/com.airvzxf.bose-connect-gui.desktop"
    install -Dm644 "${linux}/metainfo/com.airvzxf.bose-connect-gui.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/com.airvzxf.bose-connect-gui.metainfo.xml"
    install -Dm644 "${linux}/icons/hicolor/scalable/apps/bose-connect-gui.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.airvzxf.bose-connect-gui.svg"
    install -Dm644 "${linux}/icons/hicolor/symbolic/apps/bose-connect-gui.svg" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/com.airvzxf.bose-connect-gui-symbolic.svg"
    install -Dm644 "${linux}/bash-completion/bose-connect-gui" \
        "${pkgdir}/usr/share/bash-completion/completions/bose-connect-gui"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
