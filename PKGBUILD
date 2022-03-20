# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=windscribegui
pkgname="${_pkgname}-git"
pkgver=r3.ec1bccb
pkgrel=2
pkgdesc="Qt 5/6 based GUI for Windscribe VPN written in Python"
arch=("any")
url="https://github.com/shaybox/${_pkgname}"
license=("MIT")
depends=(
    "windscribe-cli"
    "python-qtpy"
    "python-windscribe"
    "python-click"
)
makedepends=(
    "git"
    "python-pip"
    "python-poetry"
)
optdepends=(
    "python-pyqt5: Qt5"
    "python-pyqt6: Qt6"
)
source=(
    "git+${url}.git"
)
sha512sums=(
    "SKIP"
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
    cd "${srcdir}/${_pkgname}"
    install -Dm644 "data/share/applications/windscribe.desktop" "${pkgdir}/usr/share/applications/windscribe.desktop"
    install -Dm644 "data/share/icons/hicolor/256x256/apps/windscribe.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/windscribe.png"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
