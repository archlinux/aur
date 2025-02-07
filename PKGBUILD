# Maintainer: Luis Aranguren <pizzaman@hotmail.com
_pkgname=taproot-assets
pkgname=${_pkgname}-bin
pkgver=0.5.0
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="A layer 1 daemon, for the Taproot Assets Protocol specification, written in Go (golang)"
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${_pkgname}d")

source=(
${_pkgname}-${_arch}-v${_pkgver}.tar.gz::"${url}/releases/download/v$_pkgver/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-guggero-v${_pkgver}.sig"
manifest-v${_pkgver}.txt::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('8250a44a3536b3a12b6b9fb04d6e24f232dba9801a8d74568cfe6f4a519ef0c8'
            'SKIP'
            'b76e3ab2daef17431171b485648f2b4267ccedf07391cabec22dec414fe44a87')

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
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/tapcli" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/tapd" -t "${pkgdir}/usr/bin";
}
