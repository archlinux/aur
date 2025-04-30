# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
_github_user_name='sevaa'
pkgname=dwex
pkgver=4.49
pkgrel=2
pkgdesc='GUI viewer for DWARF debug information'
arch=('x86_64')
url="https://github.com/${_github_user_name}/${pkgname}"
license=('BSD-3-Clause')
depends=('python>=3.6.1' 'python-filebytes>=0.10.1' 'python-pyelftools>=0.32' \
         'python-pyqt6>=6.9' 'qt6-svg>=6.9')
makedepends=('python-setuptools>=1:79')
checkdepends=()
optdepends=()
backup=()
options=()
install=
source=("https://github.com/${_github_user_name}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz" \
        "${pkgname}.png" "${pkgname}.desktop" "$pkgname-$pkgver.patch")
noextract=()
sha256sums=(7a9c37a94dd2adcc3c77771b7686f5fe7b0eea313a46f1f6393c2baa880b79cb \
            d92d16891381310a4b18cc8ae59a1a0ac99a07ca80599a7e3c003970622ba03f \
            155036828925419fe6ab40d600d5e5ada249e1b47095d17bddf7aa694a0cdb6d \
            cf4f68b033e35fe3e7f9f71b737f6b69fb540d2f5bfc142d5e0cbf1c9bc87265)
validpgpkeys=()

prepare() {
    # https://github.com/sevaa/dwex/pull/72
    # https://github.com/sevaa/dwex/pull/73

    cd "$pkgname-$pkgver"

    patch --strip=1 "--input=$srcdir/$pkgname-$pkgver.patch"
}

build() {
    cd "$pkgname-$pkgver"

    python setup.py build --verbose
}

check() {
    cd "$pkgname-$pkgver"

    python setup.py check --verbose --strict
}

package() {
    cd "$pkgname-$pkgver"

    # Install the program.
    python setup.py install --verbose --single-version-externally-managed --compile --optimize=2 \
        --prefix=/usr "--root=$pkgdir"

    # Install desktop shortcut and icons.
    install --verbose --preserve-timestamps -D \
        "--target-directory=$pkgdir/usr/share/applications" "$srcdir/${pkgname}.desktop"
    install --verbose --preserve-timestamps -D \
        "--target-directory=$pkgdir/usr/share/icons/hicolor/48x48/apps" "$srcdir/${pkgname}.png"
}
