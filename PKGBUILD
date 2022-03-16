# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Saleem Rashid <trezor@saleemrashid.com>

_pkgname=trezord
pkgname="${_pkgname}-git"
_gitname="${_pkgname}-go"
pkgver=2.0.31.r5.g106e5e9
pkgrel=1
pkgdesc='Trezor Communication Daemon aka Trezor Bridge (written in Go)'
arch=('x86_64')
url='https://github.com/trezor/trezord-go'
license=('LGPL3')
provides=("${_pkgname}" 'trezor-bridge')
conflicts=("${_pkgname}" 'trezor-bridge-bin')
makedepends=('git' 'go')
depends=('trezor-udev')
source=(
    "git+https://github.com/trezor/${_gitname}.git"
    "${_pkgname}.sysusers"
)
sha256sums=('SKIP'
            'efa561a7192a22088d1840278fc742b77f649fb3d949aa2a1d8644c681acd270'
)

_importpath="github.com/trezor/${_gitname}"

prepare() {
    cd "${srcdir}/${_gitname}"

    mkdir -p "${srcdir}/src/$(dirname "${_importpath}")"
    ln -sf -T "${srcdir}/${_gitname}" "${srcdir}/src/${_importpath}"
}

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags --long | sed \
        -e 's/^v//' \
        -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    export GOPATH="${srcdir}"
    go install \
        -gcflags "all=-trimpath=${srcdir}" \
        -asmflags "all=-trimpath=${srcdir}" \
        -ldflags "-extldflags ${LDFLAGS}" \
        "${_importpath}"
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm0755 "${srcdir}/bin/${_gitname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm0644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"

    install -Dm0644 release/linux/trezord.service "${pkgdir}/usr/lib/systemd/system/trezord.service"

    install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
