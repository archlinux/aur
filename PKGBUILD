# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>
# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=zrepl-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.0
pkgrel=2
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url="https://${_pkgname}.github.io"
license=('MIT')
options=(
    '!debug'
    '!strip'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/${_pkgname}.yml")
source=(
    "https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
    "${pkgname}-${pkgver}"::"https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=(
    'd451ad1d05a0afdc752daf1dada9327aa338f691eca91e1c8fc9828eebd89757'
    'a53391dc3e4a995778bbcc1c51d18b86004ef339f7d5d7075267b3f9a601af10'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i 's|/usr/local/bin|/usr/bin|g' "./dist/systemd/${_pkgname}.service"
    sed -i "s|USR_SHARE_ZREPL|/usr/share/doc/${pkgname}|g" ./packaging/systemd-default-zrepl.yml
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm644 "./dist/systemd/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 ./packaging/systemd-default-zrepl.yml "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"
    install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -a ./internal/config/samples "${pkgdir}/usr/share/doc/${pkgname}/examples"
    "${pkgdir}/usr/bin/${_pkgname}" gencompletion bash /dev/stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    "${pkgdir}/usr/bin/${_pkgname}" gencompletion zsh /dev/stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

# vim: ts=4 sw=4 et:
