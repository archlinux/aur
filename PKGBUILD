# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="hcgatewood"
pkgname="pdate-cli"
pkgver=0.3.0
pkgrel=1
pkgdesc="🔮 Human-readable dates and times"

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
sha256sums=('353aa843199832eb8dd90a8217f4205535025689c5df1be2d26135fffe90e774'
            '153ff393a47300a285f7f79c29cdd63039c9bbdce43f6651f3a92ec5625a03a5')

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
