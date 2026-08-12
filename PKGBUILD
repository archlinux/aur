# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-php
pkgname=python-tree-sitter-php
pkgver=0.24.2
pkgrel=7
pkgdesc="Php grammar for tree-sitter"
arch=('x86_64')
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
    # Upstream pyproject.toml has invalid 'license = "LICENSE"' (neither SPDX nor table form),
    # which fails setuptools >=82 strict validation. Normalize to SPDX.
    sed -i 's/^license = "LICENSE"$/license = "MIT"/' pyproject.toml
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
