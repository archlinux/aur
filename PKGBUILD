# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=python-barcode-git
_pkgname=python_barcode
pkgver=v0.16.1.r18.g85acbda
pkgrel=4
pkgdesc="Create standard barcodes with Python. No external modules needed. (git version)"
arch=('any')
license=('MIT')
conflicts=('python-barcode')
provides=('python-barcode')
url="https://github.com/WhyNotHugo/python-barcode"
depends=('python' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-setuptools-scm')
source=(
        "$pkgname::git+https://github.com/WhyNotHugo/python-barcode.git"
    )
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    if [ -d $pkgdir/usr/lib/python*/site-packages/docs ]; then
        install -dm755 $pkgdir/usr/share/doc/$pkgname
        mv $pkgdir/usr/lib/python*/site-packages/docs/*.rst $pkgdir/usr/share/doc/$pkgname/
        mv $pkgdir/usr/lib/python*/site-packages/docs/_static $pkgdir/usr/share/doc/$pkgname
    fi
    install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
}
