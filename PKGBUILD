# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor="PhantomLambSoft"
_gitname="CmdBox"
_gitexec="cb"

pkgname=${_gitname,,}
pkgver=1.3.1
pkgrel=1
pkgdesc="A cross-platform command manager for terminal workflows"

_pypi_package=${pkgname}-cli
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_gitname}/"
_url_github="https://github.com/${_gitauthor}/${_gitname}"
url=${_url_github}

provides=("${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-peewee' 'python-rich' 'python-psutil' 'python-tomlkit' 'python-typer' 'python-prompt_toolkit')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b4de21d061d489d73e75d96eb4c9c720c2deec3c0d6012fa56719ba84621a144')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    find . -type f -exec sed -i -e "s/${_gitexec} /${pkgname} /g" -e "s/\"${_gitexec}\"/\"${pkgname}\"/g" {} +
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
