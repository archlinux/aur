# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
pkgname=python-kdl-py
pkgver=1.2.0
pkgrel=2
pkgdesc="A parser for the KDL language"
arch=('any')
url="https://github.com/tabatkins/kdlpy/"
license=('MIT')
depends=('python>=3.7' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('63f3f46c6277dedadce44dcfc94672bf6e6bf3330b90122e0134c22857e29973')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    python tests/run.py
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir" -name "*.pyc" -delete
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
