# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.18
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-flatbuffers'
         'python-ml-dtypes'
         'python-numpy'
         'python-scipy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz")
sha256sums=('7500534702189e221fccb6eb7bac2dee55769789ef99c161eeaf9b30d7f05c7c')

prepare() {
    export JAXLIB_RELEASE=$pkgver
}

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python build/build.py \
        --bazel_startup_options="--output_user_root=$srcdir/bazel"\
        --bazel_options='--action_env=JAXLIB_RELEASE' \
        --noenable_cuda \
        --target_cpu_features release
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jaxlib-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
