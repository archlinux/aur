# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="epicallycool"
_appname="tracepatch"

pkgname="python-${_appname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Focused, opt-in runtime call tracing for a single execution context"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
url="${_url_pypi}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'ipython' 'python-django' 'python-flask' 'python-tomli' 'python-tomli-w' 'python-starlette' 'python-pytest')

provides=("${_appname}" "tph")

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('898751086c4244d348a01506baa30032526803844a3f6c09cf1c68b02c92e5e2')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -i -e 's|requires = \[.*\]|requires = \[\"uv_build\"]|g' "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
