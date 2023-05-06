# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: f3fora <f3 dot foradori at gmail dot com>

pkgname=python-rmcl
pkgver=0.4.2
pkgrel=2
pkgdesc="reMarkable Cloud Library"
arch=(any)
url="https://github.com/rschroll/rmcl/"
license=('MIT')
depends=('python-trio' 'python-asks')
makedepends=('python-poetry' 'python-setuptools' 'python-wheel')
optdepends=('python-rmrl: producing PDF versions of any type of document with your annotations included')
source=("https://files.pythonhosted.org/packages/source/r/rmcl/rmcl-$pkgver.tar.gz"
        "xdg.py::https://raw.githubusercontent.com/srstevenson/xdg/5.0.1/src/xdg/__init__.py")
sha256sums=('58de4758e7e3cb7acbf28fcfa80f4155252afdfb191beb4ba4aa36961f66cc67'
            '93a5ba17785c5e00d24ebd0e148d36470076c03fa16cf7e9a113a7d8fb1bceba')

build() {
    cd "$srcdir"/rmcl-$pkgver
    sed -r 's/^from xdg /from .xdg /' -i rmcl/*.py
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')

    cd "$srcdir"/rmcl-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    # vendoring xdg.py due to conflicts with python-pyxdg
    install -Dm0644 "$srcdir"/xdg.py "$pkgdir$_site_packages"/rmcl/xdg.py
}
