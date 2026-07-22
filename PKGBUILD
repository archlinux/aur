# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=python-hbctool
_name=hbctool
pkgver=0.1.5
pkgrel=1
pkgdesc="A command-line interface for disassembling and assembling the Hermes Bytecode"
arch=('any')
url="https://github.com/bongtrop/hbctool"
license=('MIT')
depends=('python' 'python-docopt')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('30aeb050095ba507da2ed26ea8e64a75cd63d459d0db2eeb99e189fb8421c8a3')

latestver() {
    curl -fsSL 'https://pypi.org/pypi/hbctool/json' | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])"
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_name-$pkgver/hbctool"
    PYTHONPATH=.. python test.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf "$pkgdir"/usr/lib/python*/site-packages/hbctool/hbc/*/example
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/hbctool/__pycache__
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/hbctool/hbc/__pycache__
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/hbctool/hbc/*/__pycache__
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/hbctool/hbc/*/tool/__pycache__
    rm -f "$pkgdir"/usr/lib/python*/site-packages/hbctool/test.py
    rm -f "$pkgdir"/usr/lib/python*/site-packages/hbctool/hbc/*/test.py
    rm -f "$pkgdir"/usr/lib/python*/site-packages/hbctool/hbc/*/.DS_Store

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
