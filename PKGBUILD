# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-go
pkgname=python-tree-sitter-go
pkgver=0.25.0
pkgrel=8
pkgdesc="Go grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-go/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/01/05/727308adbbc79bcb1c92fc0ea10556a735f9d0f0a5435a18f59d40f7fd77/tree_sitter_go-0.25.0.tar.gz"
    "tree-sitter-parser.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/parser.h"
    "tree-sitter-alloc.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/alloc.h"
    "tree-sitter-array.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/array.h"
    "tree-sitter-ts_assert.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.25.10/lib/src/ts_assert.h"
)
sha256sums=('a7466e9b8d94dda94cae8d91629f26edb2d26166fd454d4831c3bf6dfa2e8d68'
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
