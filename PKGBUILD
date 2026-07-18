# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="hcgatewood"
pkgname="vis-cli"
pkgver=0.8.0
pkgrel=1
pkgdesc="🔬 Visualize fuzzy tabular data without leaving the terminal"

_pypi_package=${pkgname//-/_}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/pdate_cli/${_pypi_package}"
_url_github="https://github.com/${pkgauthor}/${pkgname%-cli}"
url="${_url_github}"

provides=("${_pypi_package%%_cli}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-click' 'python-dateutil' 'python-dateparser' 'python-humanize')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz"
        "fix_warning.patch")
sha256sums=('e25cf4b6cf7878d16d0a56e5f5a717ce2d3248f953fc966be73f2091440f0440'
            'f56b2a0f75f997f223dd54fd777ce52aab3627bbc60b4a725c9863bdc295b42d')


build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${pkgdir}"

    patch -p1 < "${srcdir}/fix_warning.patch"
}
