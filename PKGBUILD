# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-kotlin
pkgname=python-tree-sitter-kotlin
pkgver=1.1.0
pkgrel=6
pkgdesc="Kotlin grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-kotlin/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/58/bb/bdab3665eeca21246130eec79c76e42456cfa72d59606266ecdbf37f9a96/tree_sitter_kotlin-1.1.0.tar.gz"
    "tree-sitter-parser.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/parser.h"
    "tree-sitter-alloc.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/alloc.h"
    "tree-sitter-array.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/array.h"
)
sha256sums=('322a35bdae75e25ae64dae6027be609c5422fab282084117816c4ebcda6168da'
    'a3eb18ef034b3f4255b965a26caa276f9cfe13a79573b402f1a12dc5018052aa'
    'c69f97ef0949199ba66157d523bac994c3aa7cab3de8d0e25ef29d74aa502e94'
    '4ff743903dc46f5db6aa54f31c6b4d160a8a9779e5b2ab1ee59ae7ebcd850ea1')


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
