# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.5.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='vis_cli'


pkgname="${_pypi_package//_/-}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="🔬 Visualize fuzzy tabular data without leaving the terminal"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/vis_cli/'
_url_github='https://github.com/hcgatewood/vis'
url="${_url_github}"

provides=("${_pypi_package%%_cli}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-seaborn' 'python-matplotlib' 'python-pytimeparse' 'python-numpy' 'python-scipy' 'python-click')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
        "fix_warning.patch")
sha256sums=('1c93e09090c5882b7a277fbd5069ec7b2707e674a1393e9591f72c35ed6c528b'
            'f56b2a0f75f997f223dd54fd777ce52aab3627bbc60b4a725c9863bdc295b42d')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${pkgdir}"

    patch -p1 < "${srcdir}/fix_warning.patch"
}
