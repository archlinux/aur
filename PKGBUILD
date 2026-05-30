# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="chrahunt"
pkgname="hlp"
pkgver=0.2.1
pkgrel=1
pkgdesc="Get Python help from the command line"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz" "${_pypi_package}.bash_autocomplete")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz" "${_pypi_package}.bash_autocomplete")
sha256sums=('e4480d3daf01ffa4d7620d0dc35ec4ed44885fc2333c6181b5ade040bddf4111'
            'c88117270ed54260e5974ace5b0df9d0aa1ca433fa76387d63bc6b0cc98088f0')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "../${_pypi_package}.bash_autocomplete" "${pkgdir}/usr/share/bash-completion/completions/${_pypi_package}"
}
