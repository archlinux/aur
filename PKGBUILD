# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zrepl-bin
_pkgname=zrepl
pkgver=0.6.1
pkgrel=3
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url='https://zrepl.github.io/'
license=('MIT')
provides=('zrepl')
conflicts=('zrepl')
source=(
    ${_pkgname}-${pkgver}::"https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
    ${_pkgname}-bin-${pkgver}::"https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=('263c82501b75a1413f8a298c1d67d7e940c1b0cb967979790773237e2a30adbd'
            '5dd2c1dc2b92f17e56f20735b23c3c02a53f7cd7089f645a79b0357c5f443c56')

package() {
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -d "${pkgdir}/usr/share/${_pkgname}"
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    install -m644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m644 "${_pkgname}-${pkgver}/dist/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -m755 "${_pkgname}-bin-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${_pkgname}-${pkgver}/config/samples" "${pkgdir}/usr/share/${_pkgname}/samples"

    "${pkgdir}/usr/bin/${_pkgname}" gencompletion zsh "${pkgdir}/usr/share/zsh/site-functions/_zrepl"
    "${pkgdir}/usr/bin/${_pkgname}" gencompletion bash "${pkgdir}/usr/share/bash-completion/completions/zrepl"

    sed -i s:/usr/local/bin/:/usr/bin/:g "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
