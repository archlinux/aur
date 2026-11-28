# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="yurijmikhalevich"
pkgname="rclip"
pkgver=4.1.3
pkgrel=1
pkgdesc="AI-Powered Semantic Photo Search for the Command Line"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv' 'python-uv-build')
depends=('python' 'python-pillow' 'python-pillow-heif' 'python-regex' 'python-requests' 'python-tqdm' 'python-huggingface-hub' 'python-numpy' 'python-ftfy' 'python-rawpy')
optdepends=('python-coremltools')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0535b3b9576ae00402b719c17bf2cf876a0a3c33c5160ddb1d14f716136224f6')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
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
