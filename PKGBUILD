# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>
_pkgname=lightning-terminal
__pkgname=lit
pkgname=${_pkgname}-bin
pkgver=0.4.1_alpha
_pkgver="${pkgver//_/-}"
pkgrel=2
pkgdesc="Lightning Terminal (LiT) is a browser-based interface for managing channel liquidity."

arch=('any')
_arch=linux-amd64

url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
optdepends=("frcli" "lncli" "lnd" "loop" "pool")
provides=("${__pkgname}d")

developer=guggero
source=(
${_pkgname}-${_arch}-v${_pkgver}.tar.gz::"${url}/releases/download/v${_pkgver}/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-${developer}-v${_pkgver}.sig"
manifest-v${_pkgver}.txt::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)


sha256sums=('10bd92cd0b2b5a0c0698b763085ded71fa2bb1106545a9ded86ee7f88a1db68e'
            'SKIP'
            'ee7dc2317a8c807cf5e9ba49a3104c0a1c968e4130f594ef3eac6275629019fc')

# LND provides manifest signatures from several developers
# To wit; guggero and roasbeef
# To import their keys run
curl https://keybase.io/guggero/pgp_keys.asc | gpg --import
curl https://keybase.io/roasbeef/pgp_keys.asc | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that the keybase accounts really belong to the developers.
validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720'
)

prepare() {
    # verify release
    gpg --verify "manifest-v${_pkgver}.txt.sig" "manifest-v${_pkgver}.txt"

    cat "manifest-v${_pkgver}.txt" \
        | grep "^[0-9a-f]\{64\}  ${_pkgname}-${_arch}-v${_pkgver}\(\.tar\.gz\)$" \
        | sha256sum -c -
}

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}d" -t "${pkgdir}/usr/bin";
}

