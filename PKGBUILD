# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="Textualize"
pkgname="rich-cli"
execname="rich"
pkgver=1.8.1
pkgrel=1
pkgdesc="Rich-cli is a command line toolbox for fancy output in the terminal"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-pygments' 'python-textual' 'python-click' 'python-rich' 'python-rich-rst' 'python-requests')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('16992bcbd454974dc53671ba1a12e189148566164aaa7370bdf6648c8b1438c3')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    sed -e "s|VERSION = \"[0-9\.].*\"|VERSION = \"${pkgver}\"|g" -i "src/${_pypi_package//-/_}/__main__.py"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
