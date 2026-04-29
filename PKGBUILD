# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-julia
pkgname=python-tree-sitter-julia
pkgver=0.23.1
pkgrel=6
pkgdesc="Julia grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-julia/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d5/e7/1ff7d38967471f13b77420cdfc58ce170c8ceb83ff4b55ce50744c076e79/tree_sitter_julia-0.23.1.tar.gz"
    "tree-sitter-parser.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/parser.h"
    "tree-sitter-alloc.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/alloc.h"
    "tree-sitter-array.h::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v0.22.6/lib/src/array.h"
)
sha256sums=('07607c4fc902b21e6821622f56b08aa2321b921fe0644e2ab4aba1747e6c8808'
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
