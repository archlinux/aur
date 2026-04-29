# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-php
pkgname=python-tree-sitter-php
pkgver=0.24.2
pkgrel=5
pkgdesc="PHP grammar for tree-sitter"
arch=('any')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-php/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e73ad63dda67ac12c0e012726a4e1a9811c26b020a0a2dea3e889f8246d9cf4')


prepare() {
    cd "${_name}-${pkgver}"

    sed -i \
        -e 's/^license\.text = "MIT"$/license = "MIT"/' \
        -e 's/^license\.text = "Apache-2.0"$/license = "Apache-2.0"/' \
        -e 's/^license = "LICENSE"$/license = "MIT"/' \
        -e '/License :: OSI Approved/d' \
        pyproject.toml
}

build() {
    cd "${_name}-${pkgver}"
    # The php grammar has multiple components, typically we build the root package
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
