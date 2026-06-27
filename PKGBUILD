# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-katharos"
pkgdesc="A functional programming and concurrency library for Python"
pkgver=1.4.0
pkgrel=1

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url='https://github.com/kamalfarahani/katharos'

depends=('python')
# checkdepends=('python-pytest')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ef8db8b6280e93f0932b158574f3f4725b4290e9712c773ba03b0448c848bb4')


prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -i -e 's|requires = \[.*\]|requires = \[\"uv_build\"]|g' "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

# check() {
#     cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"
#
#     PYTHONPATH="$PWD/src:$PYTHONPATH" pytest tests/
# }

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
