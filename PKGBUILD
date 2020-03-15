# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-sphinx-copybutton
pkgver=0.2.10
pkgrel=1
pkgdesc="Sphinx extension to add a \"copy\" button to code blocks"
url="https://sphinx-copybutton.readthedocs.io/"
arch=('any')
license=('MIT')
depends=('python-sphinx')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/s/sphinx-copybutton/sphinx-copybutton-$pkgver.tar.gz"
)
sha256sums=(
  '78d8ab9aded92275d2de8986e78c3857b9bdf5c5e0feac96a792a772f73bdf5d'
)

build() {
    cd "sphinx-copybutton-$pkgver"
    python setup.py build
}

package() {
    cd "sphinx-copybutton-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr --skip-build
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    # Files in the tarball are marked executable, leading to the files in the
    # installed _static and egg-info directories being executable. Fix that.
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    chmod 644 "$pkgdir/usr/lib/python$PYVER/site-packages/sphinx_copybutton/_static/"*
    chmod 644 "$pkgdir/usr/lib/python$PYVER/site-packages/sphinx_copybutton-$pkgver-py$PYVER.egg-info/"*
}
