# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zrepl-bin
_pkgname=zrepl
pkgver=0.4.0
pkgrel=2
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url='https://zrepl.github.io/'
license=('MIT')
provides=('zrepl')
conflicts=('zrepl')
source=(
    ${_pkgname}-${pkgver}::"https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
    ${_pkgname}-bin::"https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=('e7035a8a40913614f4ab24d7caad2c26419fd2b0aaa3565c16439e59214ae590'
            '928bbdbf16b6b2d24f9d1299bbc4616195caa3a7abfdfa171bb075bb6e62368c')

package() {
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -d "${pkgdir}/usr/share/${_pkgname}"
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    install -m644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m644 "${_pkgname}-${pkgver}/dist/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -m755 "${_pkgname}-bin" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${_pkgname}-${pkgver}/config/samples" "${pkgdir}/usr/share/${_pkgname}/samples"

    "${pkgdir}/usr/bin/${_pkgname}" gencompletion zsh "${pkgdir}/usr/share/zsh/site-functions/_zrepl"
    "${pkgdir}/usr/bin/${_pkgname}" gencompletion bash "${pkgdir}/usr/share/bash-completion/completions/zrepl"

    sed -i s:/usr/local/bin/:/usr/bin/:g "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
