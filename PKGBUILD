# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
_github_user_name='sevaa'
pkgname=dwex
pkgver=4.92
pkgrel=1
pkgdesc='GUI viewer for DWARF debug information'
arch=('any')
url="https://github.com/${_github_user_name}/${pkgname}"
license=('BSD-3-Clause')
depends=(
    'hicolor-icon-theme>=0.18'
    'python>=3.6.1'
    'python-importlib-metadata>=9.0'
    'python-pkg_resources>=81.0'
    'python-pyelftools>=0.32'
    'python-pyqt6>=6.9'
    'qt6-svg>=6.9')
makedepends=('python-setuptools>=1:79')
checkdepends=()
optdepends=()
backup=()
options=()
install=
source=(
    "https://github.com/${_github_user_name}/${pkgname}/raw/refs/tags/${pkgver}/LICENSE"
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${_github_user_name}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.png"
    "${pkgname}.desktop")
noextract=()
sha256sums=(
    '96ec745235ecae021cd0db62f896a21ecdd46495795fdb713fa714c6f9a508ac'
    '5ce4a78daa2adb2ec49a970165d79fa082df9934dec271a35e9585ec1b4845eb'
    'd92d16891381310a4b18cc8ae59a1a0ac99a07ca80599a7e3c003970622ba03f'
    '155036828925419fe6ab40d600d5e5ada249e1b47095d17bddf7aa694a0cdb6d')
validpgpkeys=()

build() {
    cd "${pkgname}-${pkgver}"

    python setup.py build --verbose
}

check() {
    cd "${pkgname}-${pkgver}"

    python setup.py check --verbose --strict
}

package() {
    cd "${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/usr"/{bin,lib,share/licenses/${pkgname}}

    install -D --preserve-timestamps --mode=644 \
        "--target-directory=${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install --verbose --preserve-timestamps -D \
        "--target-directory=${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install --verbose --preserve-timestamps -D \
        "--target-directory=${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${srcdir}/${pkgname}.png"

    python setup.py install --verbose --single-version-externally-managed --compile --optimize=2 \
        --prefix=/usr "--root=${pkgdir}"
}
