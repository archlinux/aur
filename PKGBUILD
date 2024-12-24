# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.36
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
sha256sums=('442bfdf491b509995aa160361e23a9db488d5b97c87e6648cc733501b06eda77')

build() {
    cd $srcdir/jax-jax-v$pkgver
    JAXLIB_RELEASE=$pkgver python build/build.py build \
	--wheels=jaxlib \
        --bazel_startup_options="--output_user_root=$srcdir/bazel"\
        --bazel_options='--action_env=JAXLIB_RELEASE' \
        --target_cpu_features=release
}

package() {
    cd $srcdir/jax-jax-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
