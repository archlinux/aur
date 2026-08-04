# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="someone-cloud"
_appname="PyInquirer"

pkgname="python-${_appname,,}"
pkgver=1.0.6
pkgrel=1
pkgdesc="A Python module for common interactive command line user interfaces"

_pypi_package=${pkgname##python-}-revived
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-pingparsing' 'python-pygments' 'python-prompt_toolkit' 'python-regex')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('af0c3d92a663432b0d0f32e0fe9751d814211c7c3590f0ce8ce2394980c7b30e')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    rm -rf "${pkgdir}"/usr/lib/python*/site-packages/examples/

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
