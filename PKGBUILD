# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.1.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='pdate_cli'


pkgname="${_pypi_package//_/-}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="🔮 Human-readable dates and times"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/vis_cli/'
_url_github='https://github.com/hcgatewood/vis'
url="${_url_github}"

provides=("${_pypi_package%%_cli}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-click' 'python-dateutil' 'python-dateparser' 'python-humanize')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
        "fix_warning.patch")
sha256sums=('93fe03f695caa40f57759262b06e81e06d4e31218ffb456e6388f12f44e8a071'
            '153ff393a47300a285f7f79c29cdd63039c9bbdce43f6651f3a92ec5625a03a5')

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
