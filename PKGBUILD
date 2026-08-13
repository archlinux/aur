# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="NSPC911"
_appname="textual-drivers"

pkgname="python-${_appname}"
pkgver=0.10.2
pkgrel=1
pkgdesc="Drop-in Textual drivers with lock_stdin, register_event_handler, and kitty DnD support"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-textual')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('d5fa783358bb8bd1c59a4e22a5becb7bb47002d70096492e087302be4a800f60')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
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
