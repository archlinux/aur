# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-openreview
_pkgname=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc='Official Python client library for the OpenReview API'
arch=('any')
url='https://github.com/openreview/openreview-py'
license=('MIT')
depends=(
    'python-deprecated'
    'python-editdistance'
    'python-pycryptodome'
    'python-pyjwt'
    'python-pylatexenc'
    'python-requests'
    'python-tld'
    'python-tqdm'
)
makedepends=('python-build' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ff67817ea92b79791a314d99568f04a964eeb2c054b0e41cc43825772f1c746')

prepare() {
    cd "$_pkgname-py-$pkgver"
    sed -i -E 's/"setuptools.*"([,\]]?)/"setuptools"\1/g' pyproject.toml
}

build() {
    python -m build -nw "$_pkgname-py-$pkgver"
}

package() {
    cd $_pkgname-py-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/${_pkgname}_py-${pkgver}-py3-*-*.whl
}
