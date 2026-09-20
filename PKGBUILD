# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="ashuttl"
pkgname="linecast"
pkgver=2.7.0
pkgrel=1
pkgdesc="Weather, sunlight, tides, radar, the moon, and maps, in your terminal"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-truststore')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12e004e7d48d212c3007a5cb57cea70145dbce457f72b00760a5663458c148bf')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation

    mkdir -p completions

    export PYTHONPATH="$PWD/src"

    python -m ${_pypi_package} completion zsh > "completions/${pkgname}.zsh"
    python -m ${_pypi_package} completion bash > "completions/${pkgname}.bash"
    python -m ${_pypi_package} completion fish > "completions/${pkgname}.fish"
}

# check() {
#     cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit
#
#     export PYTHONPATH="$PWD/src"
#
#     pytest
# }

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
