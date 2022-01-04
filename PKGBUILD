# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=SteamAccountSwitcher
pkgname=steamaccountswitcher-git
pkgver=r7.a4a5624
pkgrel=1
pkgdesc='Qt Steam account switcher'
arch=('any')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
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
    'a852eea005839f9376d9658eca3d39d6b7329383a3d592361d058cc505bf98cff4a79db4c1e371f216a2c1b7e2c2d2b84049bbe3ef49469b26ddb76192d776eb'
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
