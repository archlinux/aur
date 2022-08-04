# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>
_pkgname=faraday
__pkgname=fr
pkgname=${_pkgname}-bin
pkgver=0.2.8_alpha
_pkgver="${pkgver//_/-}"
pkgrel=3
pkgdesc="Faraday is a suite of tools built to help node operators and businesses run lnd, the leading implementation of the Lightning Network."
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${__pkgname}cli")

developer=""
#developer=carlakirkcohen
_developer="-${pkgver}"
source=(
${_pkgname}-${_arch}-v${_pkgver}.tar.gz::"${url}/releases/download/v${_pkgver}/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest${_developer}-v${_pkgver}.sig"
manifest-v${_pkgver}.txt::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('e5bcc2f156c0a77010e63584507759233957dc6842e5b63838de64de9e4e624c'
            'SKIP'
            '7bd4dd25c800141b2865c0aadb32d97e513f664734738e4588e4a5725ad9d563')

# LND provides manifest signatures from several developers
# To wit; guggero and roasbeef
# To import their keys run
curl https://keybase.io/guggero/pgp_keys.asc | gpg --import
curl https://keybase.io/${developer}/pgp_keys.asc | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that the keybase accounts really belong to the developers.
validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720'
    '15E7ECF257098A4EF91655EB4CA7FE54A6213C91'
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
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}cli" -t "${pkgdir}/usr/bin";
}
