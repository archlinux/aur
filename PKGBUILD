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

_url_pypi='https://pypi.org/project/human-errors/'
_url_github='https://github.com/NSPC911/human-errors'
url="${_url_github}"

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build')
depends=('python' 'python-yaml' 'python-orjson' 'python-toml' 'python-rich' 'python-poethepoet')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_upstreamver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${_upstreamver}.tar.gz")
sha256sums=('5765f071315172e83d9a555ac0aa33503c7a8fac8db80e61c37f75f5f3d8c914')

prepare() {
    cd "${srcdir}/${_pypi_package}-${_upstreamver}/"

    sed -i -e 's|requires = \[.*\]|requires = \[\"uv_build\"]|g' "./pyproject.toml"
}
build() {
    cd "${srcdir}/${_pypi_package}-${_upstreamver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_upstreamver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
