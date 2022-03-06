# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=ridengui
pkgname="${_pkgname}-git"
pkgver=r20.db74a11
pkgrel=2
pkgdesc="Qt 5/6 based GUI for Riden RDXX power supplies written in Python"
arch=("any")
url="https://github.com/shaybox/${_pkgname}"
license=("MIT")
depends=(
    "python"
    "python-riden"
    "python-pyqt5"
)
makedepends=(
    "python-poetry"
)
provides=("${_pkgname}")
source=("git+${url}.git")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    poetry build --format wheel
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm644 "data/share/applications/riden.desktop" "${pkgdir}/usr/share/applications/riden.desktop"
    install -Dm644 "data/share/icons/hicolor/32x32/apps/riden.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/riden.png"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
