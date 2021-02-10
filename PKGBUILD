# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rmrl
pkgver=0.1.2
pkgrel=2
pkgdesc="reMarkable Rendering Library"
arch=(any)
url="https://github.com/rschroll/rmrl/"
license=('GPL')
depends=('python-pdfrw' 'python-reportlab' 'python-svglib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rmrl/rmrl-$pkgver.tar.gz"
        "xdg.py::https://raw.githubusercontent.com/srstevenson/xdg/5.0.1/src/xdg/__init__.py")
sha256sums=('8c8e757af5ca3eb7475f56803f7f37256fe4c5cad3a9ea5ad7534b2ebd172447'
            '93a5ba17785c5e00d24ebd0e148d36470076c03fa16cf7e9a113a7d8fb1bceba')

build() {
    cd "$srcdir"/rmrl-$pkgver
    sed -r 's/^from xdg /from .xdg /' -i rmrl/*.py
    python setup.py build
}

package() {
    _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')

    cd "$srcdir"/rmrl-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"

    # vendoring xdg.py due to conflicts with python-pyxdg
    install -Dm0644 "$srcdir"/xdg.py "$pkgdir$_site_packages"/rmrl/xdg.py
    rm "$pkgdir$_site_packages"/rmrl-$pkgver-*.egg-info/requires.txt
}
