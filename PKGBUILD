# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.1.4'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='twg'
_pypi_name='twig'


pkgname="${_pypi_name}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Inspect, navigate, and understand complex JSON files in your terminal"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/twg'
_url_github='https://github.com/workdone0/twig'
url="${_url_github}"

provides=("${_pypi_package}" "${_pypi_name}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-textual' 'python-pyperclip' 'python-rich' 'python-ijson' 'python-yaml' 'python-json_repair')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
#         "fix_pyproject.patch")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz"
        "fix_pyproject.patch")
sha256sums=('aaf5e2cbbd93fae419ab256221160765f0097cad3bdeb167eb5b6edaf7ae5cc8'
            'c4d5ed27065c9b6ec9b6429567663a82b603827551efe306f29c1fd8ba64e0a1')

prepare() {
    cd "${srcdir}/"

    patch -p1 < fix_pyproject.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
