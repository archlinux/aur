# Maintainer: Muness Castle <muness@gmail.com>
# Contributor: Open Horizons <muness@openhorizons.me>
# AUR Package: unified-hifi-control-bin
# Pre-built binary package - downloads from GitHub releases
# Note: Web assets are embedded in the binary (ADR 002)

pkgname=unified-hifi-control-bin
_pkgname=unified-hifi-control
pkgver=4.0.2
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
sha256sums_x86_64=('794848075973de8a48c29fb3e94b53251ed51a4234826773adf9a5a1d5d3c440')
sha256sums_aarch64=('35b67adede6cef2a768e13ec21e4c91db02b7091cbb119d5977abce016bb7e5b')
sha256sums_armv7h=('54830c9019138d5b603f3ca994ae567167f8d299f8b9c51292f06fb31b87f6cc')

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
