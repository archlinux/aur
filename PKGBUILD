# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rmcl
pkgver=0.3.0
pkgrel=2
pkgdesc="FUSE access to the reMarkable Cloud"
arch=(any)
url="https://github.com/rschroll/rmfuse/"
license=('MIT')
depends=('python-trio' 'python-asks')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rmcl/rmcl-$pkgver.tar.gz"
        "xdg.py::https://raw.githubusercontent.com/srstevenson/xdg/5.0.1/src/xdg/__init__.py")
sha256sums=('df5c38176309cb119c29bf9bca9d8f2f6427280241a882106b939db17ef48f3d'
            '93a5ba17785c5e00d24ebd0e148d36470076c03fa16cf7e9a113a7d8fb1bceba')

build() {
    cd "$srcdir"/rmcl-$pkgver
    sed -r 's/^from xdg /from .xdg /' -i rmcl/*.py
    python setup.py build
}

package() {
    _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')

    cd "$srcdir"/rmcl-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"

    # vendoring xdg.py due to conflicts with python-pyxdg
    install -Dm0644 "$srcdir"/xdg.py "$pkgdir$_site_packages"/rmcl/xdg.py
    rm "$pkgdir$_site_packages"/rmcl-$pkgver-*.egg-info/requires.txt
}
