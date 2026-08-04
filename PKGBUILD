# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-katharos"
pkgdesc="A functional programming and concurrency library for Python"
pkgver=1.4.1
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
sha256sums=('2478e63dfd279775c6b1fe1b75a615b43ca06f4bf4a510f96652a45b4075f8dd')


prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
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
