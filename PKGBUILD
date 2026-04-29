# Maintainer: Your Name <your.email@example.com>

_name=tree-sitter-zig
pkgname=python-tree-sitter-zig
pkgver=1.1.2
pkgrel=1
pkgdesc="Zig grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-zig/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/5c/97/75967b81460e0ce999de4736b9ac189dcd5ad1c85aabcc398ba529f4838e/tree_sitter_zig-1.1.2.tar.gz")
sha256sums=('da24db16df92f7fcfa34448e06a14b637b1ff985f7ce2ee19183c489e187a92e')


prepare() {
    cd "${_name//-/_}-${pkgver}"
    if [ ! -f src/tree_sitter/parser.h ]; then
        mkdir -p src/tree_sitter
        curl -sLo src/tree_sitter/parser.h https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.23.0/lib/src/parser.h
        curl -sLo src/tree_sitter/alloc.h https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.23.0/lib/src/alloc.h
        curl -sLo src/tree_sitter/array.h https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.23.0/lib/src/array.h
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
