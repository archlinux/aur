# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.2.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='resvg'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Python binding of resvg, the high-performance SVG rendering library in Rust"

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/briceyan/${_pypi_package}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling' 'rust' 'cargo')
depends=('glibc' 'libgcc' 'python')
conflicts=('resvg')
provides=('resvg')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_upstreamver}.tar.gz")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${_upstreamver}.tar.gz")
sha256sums=('0a2dca53359809f45cb940e52e60d382316c7e0580814df2a23ed30a0221774c')

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

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
