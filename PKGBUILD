# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Saleem Rashid <trezor@saleemrashid.com>
_pkgname=trezord
pkgname="${_pkgname}-git"
_gitname="${_pkgname}-go"
pkgrel=1
pkgver=2.0.27.r4.g1ff6715
pkgdesc='TREZOR Communication Daemon'
url='https://trezor.io/'
arch=('i686' 'x86_64')
license=('LGPL3')
provides=("${_pkgname}" 'trezor-bridge')
conflicts=("${_pkgname}" 'trezor-bridge-bin')
makedepends=('git' 'go')
depends=()
source=(
    "git://github.com/trezor/${_gitname}.git"
    "${_pkgname}.sysusers"
    "${_pkgname}.patch"
)
sha256sums=('SKIP'
            'efa561a7192a22088d1840278fc742b77f649fb3d949aa2a1d8644c681acd270'
            '39cdb6630e4843e3509fb91990df2631780c952d887f401eb0aa6ac523db0082')

_importpath="github.com/trezor/${_gitname}"

prepare() {
    cd "${srcdir}/${_gitname}"

    git apply "${srcdir}/${_pkgname}.patch"

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

    install -Dm0644 release/linux/trezor.rules    "${pkgdir}/usr/lib/udev/rules.d/51-trezor.rules"
    install -Dm0644 release/linux/trezord.service "${pkgdir}/usr/lib/systemd/system/trezord.service"
}
