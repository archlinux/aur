# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
_github_user_name='sevaa'
pkgname=dwex
pkgver=4.80
pkgrel=3
pkgdesc='GUI viewer for DWARF debug information'
arch=('x86_64')
url="https://github.com/${_github_user_name}/${pkgname}"
license=('BSD-3-Clause')
depends=('python>=3.6.1' 'python-pyelftools>=0.32' 'python-pyqt6>=6.9' 'qt6-svg>=6.9')
makedepends=('python-setuptools>=1:79')
checkdepends=()
optdepends=()
backup=()
options=()
install=
source=("https://github.com/${_github_user_name}/${pkgname}/raw/refs/tags/${pkgver}/LICENSE"
        "https://github.com/${_github_user_name}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        '237e5d4f2fe93c72a1b09332d73cb52d871d220d.patch')
noextract=()
sha256sums=('96ec745235ecae021cd0db62f896a21ecdd46495795fdb713fa714c6f9a508ac'
            'a4ee32a394ab111786d1d296ad611a4cda4fdb56d9470531d71b3c7f8b922a2d'
            'd92d16891381310a4b18cc8ae59a1a0ac99a07ca80599a7e3c003970622ba03f'
            '155036828925419fe6ab40d600d5e5ada249e1b47095d17bddf7aa694a0cdb6d'
            '357f80648cebcf8f2b757fc5609c1f7fd175673c658239fed5cbb30a958c97bc')
validpgpkeys=()

prepare() {
    true
}

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

    patch --strip=1 --forward --unified --no-backup-if-mismatch --version-control=never "--input=${srcdir}/237e5d4f2fe93c72a1b09332d73cb52d871d220d.patch"

    python setup.py install --verbose --single-version-externally-managed --compile --optimize=2 \
        --prefix=/usr "--root=${pkgdir}"

    install -D --preserve-timestamps --mode=644 \
        "--target-directory=${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install --verbose --preserve-timestamps -D \
        "--target-directory=${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install --verbose --preserve-timestamps -D \
        "--target-directory=${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${srcdir}/${pkgname}.png"
}
