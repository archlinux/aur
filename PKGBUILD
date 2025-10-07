# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='1.2.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='spyder-terminal'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Spyder Plugin for displaying a virtual terminal (OS independent) inside the main Spyder window"
arch=('any')
url='https://docs.spyder-ide.org/current/plugins/terminal.html'
license=('MIT')
depends=('python' 'spyder' 'python-terminado' 'python-qstylizer' 'python-qtpy' 'python-tornado' 'python-requests' 'python-coloredlogs' 'python-pexpect' 'nodejs')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package}-${pkgver}.tar.gz"
        "spyder_6.patch")
sha256sums=('34235070276a0cb255a5c371cbef076a355059a8a8c71fa9805df229ea0335da'
            'f4e8dafbd82fb651ba0f7b5e10fd447fee5baad04033b3bab6ee4043536eb7be')


prepare() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    patch -p1 -i ../spyder_6.patch

    sed -i 's/pipes/shlex/g' "./setupbase.py"
}

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
