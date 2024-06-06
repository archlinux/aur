# Maintainer: Fabian Posch <aur@posch.tech>
# Contributor: Brent Carmer <bcarmer@gmail.com>

_pkgname=abc
pkgname=${_pkgname}-git
_basever=1
_patchlvl=02
_gitversion=r5444.806a996
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=2
pkgdesc="System for Sequential Logic Synthesis and Formal Verification"
url="https://people.eecs.berkeley.edu/~alanmi/abc/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('readline')
makedepends=('git' 'make' 'gcc')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=("${_pkgname}")
provides=("${_pkgname}" "lib${_pkgname}.so")

source=(
    "git+https://github.com/berkeley-abc/abc.git"
    "LICENSE"
)
sha512sums=(
    "SKIP"
    "3b34a70f67f52df1aa933ee517babf9105d65adb9d53c475b5ea02e361c6a983e6611d81772350c25653920dbc27d37c90a1cf70cbd52859c5a12e06fbeb1563"
)

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd ${_pkgname}

    # we build abc with PIC enabled, so we don't have to compile it multiple times
    # for the different targets
    make ABC_USE_PIC=1 abc libabc.so -j$(nproc)
}

package() {
    # install the license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install the binary
    install -Dm755 "${srcdir}/${_pkgname}/abc" "${pkgdir}/usr/bin/${_pkgname}"

    # install the library
    install -Dm755 "${srcdir}/${_pkgname}/libabc.so" "${pkgdir}/usr/lib/lib${_pkgname}.so"
}
