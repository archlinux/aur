# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Daniel Bershatsky <d.bershatsky2@skoltech.ru> (aur.archlinux.org/account/daskol)
pkgname=python-flax
_pkgname=${pkgname#python-}
pkgver=0.7.1
pkgrel=3
pkgdesc='A neural network library and ecosystem for JAX designed for flexibility'
arch=('any')
url='https://github.com/google/flax'
license=('Apache')
groups=('jax')
depends=(
    'python-jax'
    'python-msgpack'
    'python-numpy'
    'python-optax'
    'python-orbax-checkpoint'
    'python-rich'
    'python-tensorstore'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
optdepends=(
    'python-matplotlib: Export to TensorBoard.'
    'tensorboard: TensorBoard visualization and logging.'
)
source=("flax-$pkgver.tar.gz::https://github.com/google/flax/archive/refs/tags/v${pkgver}.tar.gz"
        'python-flax.diff')
sha256sums=('6c47b93f711c2c4e043ac9d49168370efecb1d973b1dbdae15ee30e7dc26922f'
            'SKIP')

prepare(){
    rm -rfv flax-$pkgver/flax/version.py
    cd flax-$pkgver
    patch -p 1 -i ../python-flax.diff
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

}

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}

