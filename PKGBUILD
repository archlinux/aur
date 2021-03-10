# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: f3fora <f3 dot foradori at gmail dot com>

pkgname=rmfuse
pkgver=0.2.1
pkgrel=1
pkgdesc="FUSE access to the reMarkable Cloud"
arch=(any)
url="https://github.com/rschroll/rmfuse/"
license=('MIT')
depends=('python-bidict' 'python-rmcl' 'python-rmrl')
optdepends=('python-pyfuse3: for FUSE3 (recommended)'
            'python-llfuse: for FUSE2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rmfuse/rmfuse-$pkgver.tar.gz"
        "xdg.py::https://raw.githubusercontent.com/srstevenson/xdg/5.0.1/src/xdg/__init__.py")
sha256sums=('10b2a7903136679a1e155d2c95d9f4972b1a91ef89046d997f91b4cb5bd7d23d'    
            '93a5ba17785c5e00d24ebd0e148d36470076c03fa16cf7e9a113a7d8fb1bceba')

build() {
    cd "$srcdir"/rmfuse-$pkgver
    sed -r 's/^from xdg /from .xdg /' -i rmfuse/*.py
    python setup.py build
}

package() {
    _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')

    cd "$srcdir"/rmfuse-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # vendoring xdg.py due to conflicts with python-pyxdg
    install -Dm0644 "$srcdir"/xdg.py "$pkgdir$_site_packages"/rmfuse/xdg.py
    rm "$pkgdir$_site_packages"/rmfuse-$pkgver-*.egg-info/requires.txt
}
