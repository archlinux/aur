# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="wasi-master"
pkgname="rich-tree"
pkgver=1.1.1
pkgrel=1
pkgdesc="A better tree command with beautiful icons and colors made in Python"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

_execname=r${pkgname#rich-}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-shellingham' 'python-questionary' 'python-rich' 'python-rich-click')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8528b5352d30dbd2a19941c172704cea5f89dd43af036d7d8300e5afed7e62a8')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    rm -rf "${pkgname//-/_}" && mv -f "${_execname}" "${pkgname//-/_}"

    sed -e "s|${_execname}\.__|${pkgname//-/_}.__|g" -i "pyproject.toml" -i "${pkgname//-/_}.egg-info/entry_points.txt"

    sed -e "s|packages = \[\"${_execname}\"\]|packages = [\"${pkgname//-/_}\"]|g" -i "pyproject.toml"

    sed -e "s|${_execname}\._|${pkgname//-/_}._|g" -i "${pkgname//-/_}/onboarding.py"

    sed -e "s|${_execname}|${pkgname//-/_}|g" -i "${pkgname//-/_}.egg-info/top_level.txt"

    sed -e "s|${_execname}/|${pkgname//-/_}/|g" -i "${pkgname//-/_}.egg-info/SOURCES.txt"
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
