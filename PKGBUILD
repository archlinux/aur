# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.8.2
pkgrel=1
pkgdesc='Composable transformations of Python+NumPy programs'
arch=('any')
url='https://github.com/jax-ml/jax/'
license=('Apache-2.0')
groups=('jax')
depends=(
    'python-jaxlib>=0.7.0'
    'python-ml-dtypes'
    'python-numpy'
    'python-opt_einsum'
    'python-scipy'
)
optdepends=(
    'python-protobuf: Australis'
    'python-requests: Distributed computations'
    'python-kubernetes: Distributed support in k8s clusters'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("jax-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz"
        'python-jax.diff')
sha256sums=('f7e5080c97c1aaffb490a17d174cb59a83dd037800d9c41d309287bebd15b0b8'
            'SKIP')

prepare() {
    cd jax-jax-v$pkgver
    patch -p 1 -i ../python-jax.diff
}

build() {
    JAX_RELEASE=$pkgver python -m build -nw jax-jax-v$pkgver
}

package() {
    cd jax-jax-v$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/jax-$pkgver-*.whl
}
