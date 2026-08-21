# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zrepl-dsh2dsh-bin
_pkgname=zrepl
pkgver=1.4.2
pkgrel=1
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url='https://zrepl.github.io/'
license=('MIT')
provides=('zrepl')
conflicts=('zrepl')
source=(
    ${_pkgname}-${pkgver}.tar.gz::"https://github.com/dsh2dsh/${_pkgname}/archive/v${pkgver}.tar.gz"
    "https://github.com/dsh2dsh/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('c7b1bc2c329f2b785464d9f6ff7f9e199d67476c5a3060252617378770ad8bd7'
            '7346901491fb17f195159a9a8feceb10864a1d7dcd01f213182f90fb56e08b1c')

package() {
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -d "${pkgdir}/usr/share/${_pkgname}"
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    install -m644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m644 "${_pkgname}-${pkgver}/dist/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${_pkgname}-${pkgver}/internal/config/samples" "${pkgdir}/usr/share/${_pkgname}/samples"

    "${pkgdir}/usr/bin/${_pkgname}" gencompletion zsh "${pkgdir}/usr/share/zsh/site-functions/_zrepl"
    "${pkgdir}/usr/bin/${_pkgname}" gencompletion bash "${pkgdir}/usr/share/bash-completion/completions/zrepl"

    sed -i s:/usr/local/bin/:/usr/bin/:g "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
