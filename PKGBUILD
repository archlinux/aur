# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>
_pkgname=loop
pkgname=${_pkgname}-bin
pkgver=0.16.0_beta
_pkgver="${pkgver//_/-}"
pkgrel=2
pkgdesc="Lightning Loop is a non-custodial service offered by Lightning Labs that makes it easy to move bitcoin into and out of the Lightning Network."
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${_pkgname}d")

source=(
${_pkgname}-${_arch}-v${_pkgver}.tar.gz::"${url}/releases/download/v$_pkgver/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt.sig"
manifest-v${_pkgver}.txt::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('d6ba2d2a46f82c4e038deeadaa2f7399fe1f074f966e63420e227cafd4e05844'
            'SKIP'
            'c52fa26bfa5bd80ae1ec20cc2346ea1c417e895fc844e4f2d91626fdfb1a81a8')

# LND provides manifest signatures from several developers
# To wit; guggero and roasbeef
# To import their keys run
curl https://keybase.io/guggero/pgp_keys.asc | gpg --import
curl https://keybase.io/roasbeef/pgp_keys.asc | gpg --import
curl https://keys.openpgp.org/vks/v1/by-fingerprint/DE23E73BFA8A0AD5587D2FCDE80D2F3F311FD87E | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that the keybase accounts really belong to the developers.
validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720'
    'E4D85299674B2D31FAA1892E372CBD7633C61696'
    'DE23E73BFA8A0AD5587D2FCDE80D2F3F311FD87E'
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
