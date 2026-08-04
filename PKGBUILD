# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.0.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='human-errors'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver%%.post*}"
pkgrel=1
pkgdesc="Everyone makes mistakes, show the errors to them"

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/NSPC911/${_pypi_package}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-yaml' 'python-orjson' 'python-toml' 'python-rich' 'python-poethepoet')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_upstreamver}.tar.gz"
        "LICENSE")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${_upstreamver}.tar.gz")
sha256sums=('a89e9b6725a2bbd1978957aa90e7aed31383d50d8e4103306779e1d3dee3c7c3'
            'e5b0bb6921df26e4e12805aed7a51574da5ddb4a64c0217bb55570d4d027de76')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_upstreamver}/"

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
}
build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_upstreamver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_upstreamver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
