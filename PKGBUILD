# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-dm-haiku'
_pkgname=${pkgname#python-}
pkgver=0.0.14
pkgrel=1
pkgdesc='A library for building neural networks in JAX'
arch=('x86_64')
url='https://github.com/deepmind/dm-haiku'
license=('Apache')
groups=('deepmind' 'jax')
depends=('python-absl' 'python-jax' 'python-jmp' 'python-numpy' 'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=(
    'python-flax: Integration with flax'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'python-dm-haiku.diff')
sha256sums=('e006e9a1f4f39cd3dcc4b2d96645716c936d91b7c3d14da414e483bb2f24cd57'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../python-dm-haiku.diff
}

build() {
    python -m build -nw "$_pkgname-$pkgver"
}

check() {
  cd "$_pkgname-$pkgver"
  python -c 'import haiku'
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    dist/${_pkgname/-/_}-$pkgver-*.whl
}
