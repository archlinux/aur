# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.1.0.post2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='multiarchive'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver%%.post*}"
pkgrel=3
pkgdesc="A high level archive handler for Python"

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/NSPC911/${_pypi_package}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-rarfile')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_upstreamver}.tar.gz"
        "LICENSE")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${_upstreamver}.tar.gz")
sha256sums=('0a171f969a9cf8a3f96cb7aa6ac8a99f324ae5db629c228f09723b791b118000'
            '4f0239fdf0572b5752c8efacf1ce6b1060181479b504b3a5e22e0aa7af6176f1')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_upstreamver}/"

    sed -i -e 's|requires = \[.*\]|requires = \[\"uv_build\"]|g' "./pyproject.toml"
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
