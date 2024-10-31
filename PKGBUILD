# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-plum-dispatch
_pkgname=${pkgname#python-}
pkgver=2.5.2
pkgrel=3
pkgdesc='Multiple dispatch in Python'
arch=('any')
url='https://github.com/beartype/plum'
license=('Apache')
groups=()
conflicts=('python-plum')
depends=('python-beartype' 'python-rich')
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.diff")
sha256sums=('bc688e208e550a5ca5531f876302b1621c2f6b7979e4fe573a5c9a80739aed99'
            'SKIP')

prepare() {
    cd $srcdir/plum-$pkgver
    echo "__version__ = '$pkgver'" > plum/_version.py
    sed -i '/_version.py/d' .gitignore
    patch -p 1 -i ../${pkgname}.diff
}

build() {
    python -m build -nw $srcdir/plum-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/plum-$pkgver/dist/${_pkgname/-/_}-$pkgver-*-*.whl
}
