# Maintainer: Yuri Nogueira <personal@yurinogueira.dev.br>
# Upstream Author / Creator: Mykhailo Tseluiko (wyruweso) <tseluiko.m@gmail.com>
# Upstream URL: https://github.com/wyruweso/openp2s

_pkgname=openp2s
pkgname=${_pkgname}-bin
pkgver=0.3.0 # renovate: datasource=github-releases depName=wyruweso/openp2s
pkgrel=1
pkgdesc="Native Linux client for Azure Point-to-Site VPNs using Microsoft Entra ID authentication (created by Mykhailo Tseluiko)"
arch=('x86_64')
url="https://github.com/wyruweso/${_pkgname}"
license=(
    'GPL-2.0-only'
    'LicenseRef-OpenVPN-GPL-2.0-with-exceptions'
    'MIT'
    'BSD-3-Clause'
    'Apache-2.0'
)
depends=(
    'ca-certificates-utils'
    'gcc-libs'
    'glibc'
    'iproute2'
    'libcap-ng'
    'openssl-3'
    'systemd'
)
optdepends=(
    'sudo: privilege escalation for openvpn and resolvectl when running unprivileged'
    'xdg-utils: launch browser automatically for Microsoft Entra ID interactive sign-in'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# CRITICAL: Do not strip either binary:
# - /usr/bin/openp2s is a Node.js Single Executable Application (SEA); stripping corrupts the appended SEA blob.
# - /usr/lib/openp2s/openvpn has its SHA-256 recorded in /usr/lib/openp2s/BUILDINFO and verified at runtime.
options=('!strip' '!debug')
install="${pkgname}.install"
source_x86_64=(
    "https://github.com/wyruweso/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz"
    "${_pkgname}-${pkgver}.1::https://raw.githubusercontent.com/wyruweso/${_pkgname}/v${pkgver}/packaging/${_pkgname}.1"
)
sha256sums_x86_64=(
    'c6b1c496482a28a7df74011e212597d2bcf1aee6f7b1cece6348a9cb0b43f67c'
    '592d9ea28d225fe39714b591efefaebb2445e5e22c8e71d0e4ea5ee573c71ba0'
)

check() {
    local _bundle="${srcdir}/${_pkgname}-${pkgver}-linux-amd64"

    # Verify internal release manifest checksums
    (cd "${_bundle}" && sha256sum --quiet --check SHA256SUMS)

    # Verify CLI and patched OpenVPN binaries execute and report expected version
    local _ver
    _ver="$("${_bundle}/openp2s" --version)"
    if [[ "${_ver}" != "${pkgver}" ]]; then
        echo "Error: binary reported version '${_ver}', expected '${pkgver}'" >&2
        return 1
    fi
    "${_bundle}/openvpn-openp2s" --version >/dev/null
}

package() {
    local _bundle="${srcdir}/${_pkgname}-${pkgver}-linux-amd64"

    # Main CLI executable
    install -Dm755 "${_bundle}/openp2s" "${pkgdir}/usr/bin/openp2s"

    # Private OpenP2S-patched OpenVPN binary and cryptographic provenance manifest
    # (deliberately under /usr/lib/openp2s so it never shadows system /usr/bin/openvpn)
    install -Dm755 "${_bundle}/openvpn-openp2s" "${pkgdir}/usr/lib/${_pkgname}/openvpn"
    install -Dm644 "${_bundle}/BUILDINFO" "${pkgdir}/usr/lib/${_pkgname}/BUILDINFO"

    # Manual page
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

    # Documentation
    install -Dm644 "${_bundle}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "${_bundle}/THIRD_PARTY_NOTICES" "${pkgdir}/usr/share/doc/${_pkgname}/THIRD_PARTY_NOTICES"

    # Licenses & Third-Party Notices
    install -Dm644 "${_bundle}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_bundle}/NODE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NODE_LICENSE"
    install -Dm644 "${_bundle}/openvpn-COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/openvpn-COPYING"
    install -Dm644 "${_bundle}/THIRD_PARTY_NOTICES" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"

    # Upstream Author & Attribution record
    cat <<EOF > "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
OpenP2S — Native Linux client for Azure Point-to-Site VPNs using Microsoft Entra ID authentication
===================================================================================================

Creator & Lead Developer:
  Mykhailo Tseluiko (@wyruweso) <tseluiko.m@gmail.com>
  https://github.com/wyruweso/openp2s

Upstream Contributors:
  - Mykhailo Tseluiko (@wyruweso)
  - @tgburgin
  - @kennethgeerts
  - @Barum-Niazi

Prior Investigation Attributed by Upstream:
  - cveld (https://github.com/cveld/azure-vpn-client-headless-container)
  - Luca Boccassi (OpenVPN long-credentials / management interface patches)
  - oal (https://github.com/oal/microsoft-azure-vpn-ubuntu-26.04-lts-fix)

Arch Linux (AUR) Packaging:
  Yuri Nogueira <personal@yurinogueira.dev.br>
EOF
    chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
