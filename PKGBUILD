# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=SteamAccountSwitcher
pkgname=steamaccountswitcher-git
pkgver=r8.ba83886
pkgrel=1
pkgdesc='Qt Steam account switcher for linux'
arch=('any')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=(
    'steam'
)
makedepends=(
    'git'
    'python-pip'
    'python-poetry'
)
source=(
    "git+${url}.git"
    "${_pkgname}.desktop"
)
sha512sums=(
    'SKIP'
    'cb8a5a23ce20dcb4df32a4f632cd3f2b8af49783f91c024cc280b5e3f5d380351a0749784a7ae5a281024a6c0216d5ea957a0841440a3016f9df023cea22b308'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    poetry build --format wheel
}

package() {
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_pkgname}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
