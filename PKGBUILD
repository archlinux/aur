# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>
_pkgname=pool
pkgname=${_pkgname}-bin
pkgver=0.5.3_alpha
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Pool: a non-custodial batched uniform clearing-price auction for Lightning Channel Leases (LCL). An LCL packages up inbound channel liquidity (ability to receive funds) as a fixed income asset with a maturity date expressed in blocks."
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${_pkgname}d")

source=(
${_pkgname}-${_arch}-v${_pkgver}.tar.gz::"${url}/releases/download/v$_pkgver/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.sig"
manifest-v${_pkgver}.txt::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('35584b041255dd6f3ae8639f2fd5ea77c0f19f93616a730d8db9d8497c80785c'
            'SKIP'
            '025e449c9d5de00b8dfc22df825dbbdc74eb66c4656644952ae72a731ea7f439')

# LND provides manifest signatures from several developers
# To wit; guggero and roasbeef
# To import their keys run
curl https://keybase.io/guggero/pgp_keys.asc | gpg --import
#curl https://keybase.io/roasbeef/pgp_keys.sig | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that the keybase accounts really belong to the developers.
validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720'
    # 'E4D85299674B2D31FAA1892E372CBD7633C61696'
)

prepare() {
    # verify release
    gpg --verify "manifest-v${_pkgver}.txt.sig" "manifest-v${_pkgver}.txt"

    cat "manifest-v${_pkgver}.txt" \
        | grep "^[0-9a-f]\{64\}  ${_pkgname}-${_arch}-v${_pkgver}\(\.tar\.gz\)$" \
        | sha256sum -c -
}

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}d" -t "${pkgdir}/usr/bin";
}
