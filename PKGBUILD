# Maintainer: sidkurella <siddharthkurella at gmail dot com>

pkgname=python-tree-sitter-html
_gitpkgname=tree-sitter-html
pkgver=0.23.2
pkgrel=1
pkgdesc='HTML grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-html'
license=('MIT')
depends=(
    'glibc'
    'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-tree-sitter'
)

source=(
    "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-html/archive/v${pkgver}.tar.gz"
)
sha512sums=('71b8eb2907d372c55a3a28f1d4323fe86b7fcdc028e89ba471bbe49b3b3ca77cb84c9ef41543db44d24dc824625ec2da9767894267104c4386071334023b0f72')

build() {
    cd "${_gitpkgname}-${pkgver}"

    echo >&2 'Building wheel'
    python -m build --wheel --no-isolation
}

check() {
    cd "${_gitpkgname}-${pkgver}"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl

    echo >&2 'Running unit tests'
    test-env/bin/python -m pytest bindings/python/tests
}

package() {
    cd "${_gitpkgname}-${pkgver}"

    echo >&2 'Packaging the wheel'
    python -I -m installer --destdir="${pkgdir}" dist/*.whl

    echo >&2 'Packaging the documentation'
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        README.md

    echo >&2 'Packaging the license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        LICENSE
}
