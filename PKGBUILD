# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname=tree-sitter-bash
pkgname=python-${_pkgname}
pkgver=0.25.1
pkgrel=2
pkgdesc='Bash grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-bash'
license=('MIT')
depends=(
    'python'
    'python-tree-sitter'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}"
    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    python -m installer --destdir="${srcdir}/tmp_install" dist/*.whl
    PYTHONPATH="${srcdir}/tmp_install${_site}" python -m pytest bindings/python/tests -v
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
