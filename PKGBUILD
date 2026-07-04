# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="maxludden"
_appname="rich-gradient-cli"
_cliname="gradient"

pkgname="${_appname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI for creating rich renderables in gradient color"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling' 'sed')
depends=('python' 'python-rich' 'python-click' 'python-typer' 'python-rich-gradient')
provides=("${_cliname}")

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz" "LICENSE")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz" "LICENSE")
sha256sums=('5d959f195452e0b7d67c5cfaeccb377cca92e20c29c1a493ea999166e9c42faa'
            'ce03c1e0e64ef777f23081460c6474be87d9298b649dca8a01059c51ad9e1b30')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -e 's/requires = \[.*\]/requires = \[\"uv_build\"]/g' -i "./pyproject.toml"

    sed -e '/chain/d' -i "src/rich_gradient_cli/__init__.py"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
