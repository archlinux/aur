# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="wasi-master"
pkgname="pypi-command-line"
pkgver=1.10.1
pkgrel=1
pkgdesc="A powerful, colorful, beautiful command-line-interface for pypi.org"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

_execname=${pkgname%-command-line}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-click' 'python-rich' 'python-rich-rst' 'python-rich-click' 'python-pkg_resources' 'python-questionary' 'python-packaging' 'python-requests' 'python-requests-cache' 'python-ujson' 'python-tomli' 'python-toml' 'python-lxml' 'python-beautifulsoup4' 'python-typer' 'python-rapidfuzz' 'python-humanize' 'python-thefuzz')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz" "fix_cache.patch")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz" "fix_cache.patch")
sha256sums=('ac59d061be7f1e439e2e65acf51908e9576f95ea86da6ebfc5fc9cd272f18bc9'
            'd6121850956d45c21ff3894be9818c3ca67306e92483b620d0533ba9aa76d769')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    patch -Np1 -i "../fix_cache.patch"
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
