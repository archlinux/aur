# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mc-agent
pkgver=20171210
pkgrel=2
pkgdesc='Simple ssh-agent that loads keys stored from Moolticute'
arch=('x86_64')
license=('GPL3')
depends=('moolticute')
makedepends=('git'
             'go')
url="https://github.com/raoulh/${pkgname}"
_gourl="${url##https://}"
install="${pkgname}.install"

build() {
    cd "${srcdir}"

    GOPATH="${srcdir}" go get -fix -v -x "${_gourl}"
}

package() {
    local _up_systemd_unit_file="${srcdir}/src/${_gourl}/systemd/mc-agent.service"

    cd "${srcdir}"

    if [ ! -f "${_up_systemd_unit_file}" ]; then
        _up_systemd_unit_file="${srcdir}/src/${_gourl}/systemd/moolticute-ssh-agent.service"
    fi

    install -p -Dm 755 "${srcdir}/bin/mc-agent"                         \
            "${pkgdir}/usr/bin/mc-agent"
    install -Dm 644 "${_up_systemd_unit_file}"                          \
            "${pkgdir}/usr/lib/systemd/user/mc-agent.service"
}
