# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.21
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
sha256sums=('8d57f66d00b9c0b824b1eff84adda5b765a412b3f316ef7c773632d1edbf9477')

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    JAXLIB_RELEASE=$pkgver python build/build.py \
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
