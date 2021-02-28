# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: f3fora <f3 dot foradori at gmail dot com>

pkgname=python-rmcl
pkgver=0.4.0
pkgrel=1
pkgdesc="reMarkable Cloud Library"
arch=(any)
url="https://github.com/rschroll/rmcl/"
license=('MIT')
depends=('python-trio' 'python-asks')
makedepends=('python-setuptools')
optdepends=('python-rmrl: producing PDF versions of any type of document with your annotations included')
source=("https://files.pythonhosted.org/packages/source/r/rmcl/rmcl-$pkgver.tar.gz"
    "xdg.py::https://raw.githubusercontent.com/srstevenson/xdg/5.0.1/src/xdg/__init__.py")
sha256sums=('14bd199ff2c71269c3c1ac63d10932de6c68a250a454550940dae3f06b07527a'
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
