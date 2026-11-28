# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="bubble-sandbox"
pkgver=0.13
pkgrel=1
pkgdesc="Python script execution with bubblewrap sandboxing"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('Unlincense')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
url=${_url_pypi}

provides=("${_pypi_package}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv' 'python-uv-build')
depends=('python' 'python-pydantic' 'python-pydantic-settings' 'python-rich' 'python-typer' 'python-yaml')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('45e6fbb6f23286c3ef8cdf95dc7c34f53169835d1ea7e58742f5ea84f2b3e27d')


prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
