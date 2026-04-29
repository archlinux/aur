# Maintainer: Your Name <your.email@example.com>

_name=tree-sitter-kotlin
pkgname=python-tree-sitter-kotlin
pkgver=1.1.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/58/bb/bdab3665eeca21246130eec79c76e42456cfa72d59606266ecdbf37f9a96/tree_sitter_kotlin-1.1.0.tar.gz")
sha256sums=('322a35bdae75e25ae64dae6027be609c5422fab282084117816c4ebcda6168da')


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
