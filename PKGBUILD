# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: f3fora <f3 dot foradori at gmail dot com>

pkgname=rmfuse
pkgver=0.2.0
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
sha256sums=('0a9bcbe1e24f0bacedeb947007e7363d6d082bb72e26bea042d6c7ccddb12d91'    
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
