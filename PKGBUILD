# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-powershell
pkgname=python-tree-sitter-powershell
pkgver=0.26.3
pkgrel=8
pkgdesc="A Powershell grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-powershell/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/55/bc/5f0735a5836fab553c13673897988d2782d52cb0ca0541f47032b2c63e27/tree_sitter_powershell-0.26.3.tar.gz"
    "tree-sitter-parser.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/parser.h"
    "tree-sitter-alloc.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/alloc.h"
    "tree-sitter-array.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/array.h"
    "tree-sitter-ts_assert.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/ts_assert.h"
)
sha256sums=('9f349e60a55f29e98bbe12b19d16e95d5956f9816d7df974d57b806787389330'
    '180b893c8734778fd32f372dfbc27bd6ad1cd2221f26150b31256ff6716320d2'
    '2ad7cc5391be8043ffdcc111b9b21b7767f592790fc8389acb6fcee7fd1acb61'
    '2ee1350009660a2dd5d116f9e9644d280f1703ef1c7b460d9d46a7f3dee1c816'
    'ac1ec4b7ba388a9d8708feeb6c5c766b2927cecfd6db644b939772e1dc086526')


prepare() {
    cd "${_name//-/_}-${pkgver}"

    sed -i \
        -e 's/^license\.text = "MIT"$/license = "MIT"/' \
        -e 's/^license\.text = "Apache-2.0"$/license = "Apache-2.0"/' \
        -e 's/^license = "LICENSE"$/license = "MIT"/' \
        -e '/License :: OSI Approved/d' \
        pyproject.toml

    mkdir -p src/tree_sitter
    cp "${srcdir}/tree-sitter-parser.h" src/tree_sitter/parser.h
    cp "${srcdir}/tree-sitter-alloc.h" src/tree_sitter/alloc.h
    cp "${srcdir}/tree-sitter-array.h" src/tree_sitter/array.h
    cp "${srcdir}/tree-sitter-ts_assert.h" src/tree_sitter/ts_assert.h
}

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
