# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.23
pkgrel=3
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
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz")
sha256sums=('e4c06d62ba54becffd91abc862627b8b11b79c5a77366af8843b819665b6d568')

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    JAXLIB_RELEASE=$pkgver python build/build.py \
        --bazel_startup_options="--output_user_root=$srcdir/bazel"\
        --bazel_options='--action_env=JAXLIB_RELEASE' \
        --noenable_cuda \
        --target_cpu_features=release
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jaxlib-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
