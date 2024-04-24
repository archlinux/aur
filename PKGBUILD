# Maintainer: Mark Collins <tera_1225 hat hotmail dot com>

pkgname=beets-drop2beets
_name=${pkgname#beets-}
pkgver=2.0.1
pkgrel=1
pkgdesc="A Beets plug-in that imports singles as soon as they are dropped in a folder."
url="https://github.com/martinkirch/$_name"
arch=('any')
license=('WTFPL')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-poetry' 'python-watchdog' 'beets' )
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cd8fdd336f77ed0ed79e2051f7282d9ddb5caa2507f3b2e850afce18c2bca216')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    python_ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    # These are already provided by beets...
    rm "${pkgdir}/usr/lib/python3.11/site-packages/beetsplug/__init__.py"
    rm "${pkgdir}/usr/lib/python3.11/site-packages/beetsplug/__pycache__/__init__.cpython-311.pyc"
    rm "${pkgdir}/usr/lib/python3.11/site-packages/beetsplug/__pycache__/__init__.cpython-311.opt-1.pyc"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/lib/python${python_ver}/site-packages/${_name}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


