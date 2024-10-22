# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.33
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/jax-ml/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-flatbuffers'
         'python-ml-dtypes>=0.4.0'
         'python-numpy'
         'python-scipy')
makedepends=('clang' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("jax-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('122a806e80fc1cd7d8ffaf9620701f2cb8e4fe22271c2cec53a9c60b30bd4c31')

build() {
    cd $srcdir/jax-jax-v$pkgver
    JAXLIB_RELEASE=$pkgver python build/build.py \
        --bazel_startup_options="--output_user_root=$srcdir/bazel"\
        --bazel_options='--action_env=JAXLIB_RELEASE' \
        --noenable_cuda \
        --target_cpu_features=release
}

package() {
    cd $srcdir/jax-jax-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
