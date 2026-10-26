# Maintainer: Muness Castle <muness@gmail.com>
# Contributor: Open Horizons <muness@openhorizons.me>
# AUR Package: unified-hifi-control-bin
# Pre-built binary package - downloads from GitHub releases
# Note: Web assets are embedded in the binary (ADR 002)

pkgname=unified-hifi-control-bin
_pkgname=unified-hifi-control
pkgver=4.0.0
pkgrel=1
pkgdesc="Hi-fi control bridge for Roon, LMS, HQPlayer, and hardware surfaces"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/open-horizon-labs/unified-hifi-control"
license=('PolyForm-Noncommercial-1.0.0')
options=('!debug' '!strip')
depends=('libvips')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"

# Architecture-specific binaries (renamed to 'binary' for $CARCH-agnostic reference)
source_x86_64=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-x64")
source_aarch64=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-arm64")
source_armv7h=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-armv7")

# Common files (no separate web assets - embedded in binary)
source=("${_pkgname}.service"
        "LICENSE.upstream::https://raw.githubusercontent.com/open-horizon-labs/unified-hifi-control/v${pkgver}/LICENSE")

# Updated automatically by the release workflow.
sha256sums=('7c8695dd38bb67c64ee8a428003b9f874f7718270d84597f7e8ed9ef061ddd73'
            'ffcca38841adb694b6f380647e15f17c446a4d1656fed51a1e2041d064c94cc8')
sha256sums_x86_64=('4c068df2d5a005a4f713c7d1361d07c6676650251c7590e6f2a36d0051078033')
sha256sums_aarch64=('948267862983dd68b223a26df508020d65bf3e0a9e6eddbbdb4d3283cb5e484b')
sha256sums_armv7h=('deac5172ee8986522f99546a935b7789f2ea82c5278006e6be6ec6907debdebc')

package() {
    cd "${srcdir}"

    # Install binary (includes embedded web assets)
    install -Dm755 binary "${pkgdir}/usr/bin/${_pkgname}"

    # Install systemd service
    install -Dm644 "${_pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    # Install license
    install -Dm644 LICENSE.upstream "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
