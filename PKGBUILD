# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="NSPC911"
_appname="multiarchive"

pkgname="python-${_appname}"
pkgver=0.1.2
pkgrel=1
pkgdesc="A high level archive handler for Python"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-rarfile')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz" "LICENSE")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz" "LICENSE")
sha256sums=('f923c5c9d6cf6e01ec65416cdbbe617a66a7d4f9feaa0e07413d768d147e3e7f'
            '4f0239fdf0572b5752c8efacf1ce6b1060181479b504b3a5e22e0aa7af6176f1')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -i -e 's|requires = \[.*\]|requires = \[\"uv_build\"]|g' "./pyproject.toml"
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
