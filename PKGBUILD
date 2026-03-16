# Maintainer: Muness Castle <muness@gmail.com>
# Contributor: Open Horizons <muness@openhorizons.me>
# AUR Package: unified-hifi-control-bin
# Pre-built binary package - downloads from GitHub releases
# Note: Web assets are embedded in the binary (ADR 002)

pkgname=unified-hifi-control-bin
_pkgname=unified-hifi-control
pkgver=3.3.2
pkgrel=1
pkgdesc="Source-agnostic hi-fi control bridge for Roon, LMS, HQPlayer, and hardware surfaces"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/open-horizon-labs/unified-hifi-control"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/unified-hifi-control/config.json')
install="${_pkgname}.install"

# Architecture-specific binaries (renamed to 'binary' for $CARCH-agnostic reference)
source_x86_64=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-x64")
source_aarch64=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-arm64")
source_armv7h=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-armv7")

# Common files (no separate web assets - embedded in binary)
source=("${_pkgname}.service"
        "${_pkgname}.install"
        "LICENSE::https://raw.githubusercontent.com/open-horizon-labs/unified-hifi-control/v3/LICENSE")

# Checksums - update these for each release
# Run: updpkgsums
sha256sums=('SKIP'  # service file
            'SKIP'  # install script
            'SKIP') # license
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')

package() {
    cd "${srcdir}"

    # Install binary (includes embedded web assets)
    install -Dm755 binary "${pkgdir}/usr/bin/${_pkgname}"

    # Install systemd service
    install -Dm644 "${_pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    # Create config directory
    install -dm755 "${pkgdir}/etc/${_pkgname}"

    # Create state directory (for runtime data)
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
