pkgbase=inkstitch
pkgname=('python-pystitch' 'inkstitch')
pkgver=3.3.0
pkgrel=2
arch=('any')
url="https://inkstitch.org/"
_pystitchver=1.0.1
makedepends=('gettext' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
    "https://github.com/inkstitch/inkstitch/archive/refs/tags/v${pkgver}.tar.gz"
    "https://files.pythonhosted.org/packages/source/p/pystitch/pystitch-${_pystitchver}.tar.gz"
)
b2sums=(
    '02a5696d39333684ccc5dbf7311338e0f0aa540df66e4eec57c1524f782067ae1faef912fe90e6af847f38bdc3ff1105853a456bc5b29b6e4f2caa72352db7ef'
    '726e3fbcbd206de7449f2b179cfacd5020071cb51f78f0aec7889eded3f6b4ecc7193fc5725b86bfc3f286096c529f9bc0dab5af00cc72264b3daa01fe2caa58'
)

build() {
    cd "pystitch-${_pystitchver}"
    python -m build --wheel --no-isolation

    cd "$srcdir/inkstitch-${pkgver}"
    GITHUB_REF="refs/tags/v${pkgver}" PYTHONPATH="$srcdir/pystitch-${_pystitchver}/src${PYTHONPATH:+:$PYTHONPATH}" \
        make PYTHON_EXECUTABLE=python inx
}

package_python-pystitch() {
    pkgdesc="Pure Python library for the reading and writing of embroidery files"
    license=('MIT')
    depends=('python')
    provides=('pystitch')

    cd "pystitch-${_pystitchver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-pystitch/LICENSE"
}

package_inkstitch() {
    pkgdesc="An open source machine embroidery design platform based on Inkscape"
    license=('GPL-3.0-or-later')
    depends=('inkscape' 'python-colormath2' 'python-diskcache' 'python-flask'
             'python-fonttools' 'python-jinja' 'python-lxml' 'python-networkx'
             'python-numpy' 'python-platformdirs' 'python-pystitch' 'python-shapely'
             'python-trimesh' 'python-wxpython')

    cd "$srcdir/inkstitch-${pkgver}"
    install -dm755 "$pkgdir/usr/share/inkscape/extensions/inkstitch"
    cp -a inkstitch.py lib addons dbus fonts icons locales palettes symbols tiles \
          print inx VERSION LICENSE "$pkgdir/usr/share/inkscape/extensions/inkstitch/"
    find "$pkgdir/usr/share/inkscape/extensions/inkstitch" -name '__pycache__' -type d -prune -exec rm -rf {} \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/inkstitch/LICENSE"
}
