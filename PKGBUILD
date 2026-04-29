# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-lua
pkgname=python-tree-sitter-lua
pkgver=0.5.0
pkgrel=1
pkgdesc="Lua grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-lua/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/94/07/98d7c5f60c9a79a1d40f85e59b7c25a0102d2eebcc5a83608c7c308edf22/tree_sitter_lua-0.5.0.tar.gz")
sha256sums=('0e46356038ccb8ce1049289104c56230003448309a335f2e353f1edc7b373552')


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
