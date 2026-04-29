# Maintainer: Your Name <your.email@example.com>

_name=tree-sitter-java
pkgname=python-tree-sitter-java
pkgver=0.23.5
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fa/dc/eb9c8f96304e5d8ae1663126d89967a622a80937ad2909903569ccb7ec8f/tree_sitter_java-0.23.5.tar.gz")
sha256sums=('f5cd57b8f1270a7f0438878750d02ccc79421d45cca65ff284f1527e9ef02e38')


prepare() {
    cd "${_name//-/_}-${pkgver}"
    if [ ! -f src/tree_sitter/parser.h ]; then
        mkdir -p src/tree_sitter
        curl -sLo src/tree_sitter/parser.h https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/parser.h
        curl -sLo src/tree_sitter/alloc.h https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/alloc.h
        curl -sLo src/tree_sitter/array.h https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/array.h
    fi
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
