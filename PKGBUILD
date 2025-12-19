# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='twg'
_pypi_name='twig'


pkgname="${_pypi_name}"
pkgver="${_upstreamver}"
pkgrel=2
pkgdesc="Inspect, navigate, and understand complex JSON files in your terminal"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/twg'
_url_github='https://github.com/workdone0/twig'
url="${_url_github}"

provides=("${_pypi_package}" "${_pypi_name}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-textual' 'python-pyperclip' 'python-rich' 'python-ijson' 'python-json_repair')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ae0ede73646c1f04a6e077799503b6e28925e99481a040b02afdda7cae1efd1')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    msg2 "Patching BUG 'https://github.com/workdone0/twig/issues/37'"
    sed -i -e '324d' "./src/twg/ui/app.py"
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
