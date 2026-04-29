# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-java
pkgname=python-tree-sitter-java
pkgver=0.23.5
pkgrel=6
pkgdesc="Java grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-java/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fa/dc/eb9c8f96304e5d8ae1663126d89967a622a80937ad2909903569ccb7ec8f/tree_sitter_java-0.23.5.tar.gz"
    "tree-sitter-parser.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/parser.h"
    "tree-sitter-alloc.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/alloc.h"
    "tree-sitter-array.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/array.h"
)
sha256sums=('f5cd57b8f1270a7f0438878750d02ccc79421d45cca65ff284f1527e9ef02e38'
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
