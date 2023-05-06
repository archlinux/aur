# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: f3fora <f3 dot foradori at gmail dot com>

pkgname=rmfuse
pkgver=0.2.3
pkgrel=2
pkgdesc="FUSE access to the reMarkable Cloud"
arch=(any)
url="https://github.com/rschroll/rmfuse/"
license=('MIT')
depends=('python-bidict' 'python-rmcl' 'python-rmrl')
optdepends=('python-pyfuse3: for FUSE3 (recommended)'
            'python-llfuse: for FUSE2')
makedepends=('python-poetry' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/r/rmfuse/rmfuse-$pkgver.tar.gz"
        "xdg.py::https://raw.githubusercontent.com/srstevenson/xdg/5.0.1/src/xdg/__init__.py")
sha256sums=('94f71ef2d8aa20fc9981b0a00318800dc6be2518d4cd82c37c0d2d7f54907ed2'
            '93a5ba17785c5e00d24ebd0e148d36470076c03fa16cf7e9a113a7d8fb1bceba')

build() {
    cd "$srcdir"/rmfuse-$pkgver
    sed -r 's/^from xdg /from .xdg /' -i rmfuse/*.py
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')

    cd "$srcdir"/rmfuse-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # vendoring xdg.py due to conflicts with python-pyxdg
    install -Dm0644 "$srcdir"/xdg.py "$pkgdir$_site_packages"/rmfuse/xdg.py
}
