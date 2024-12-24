# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib-cuda
pkgver=0.4.38
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/jax-ml/jax/'
license=('Apache')
groups=('jax')
depends=('cuda' 'cudnn' 'nccl' 'openssl' 'python-absl' 'python-flatbuffers'
         'python-ml-dtypes>=0.4.0' 'python-numpy' 'python-scipy')
makedepends=('gcc13' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
provides=("python-jaxlib=$pkgver")
source=("jaxlib-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz"
        'https://github.com/bazelbuild/bazel/releases/download/6.5.0/bazel-6.5.0-linux-x86_64')
sha256sums=('ca1e63c488d505b9c92e81499e8b06cc1977319c50d64a0e58adbd2dae1a625c'
            'a40ac69263440761199fcb8da47ad4e3f328cbe79ffbf4ecc14e5ba252857307')

prepare() {
    ln -sf $(readlink bazel-6.5.0-linux-x86_64) $srcdir/jax-jax-v${pkgver}/build
    chmod +x $srcdir/bazel-6.5.0-linux-x86_64
}

build() {
    # CUDA and CUDNN versions.
    export CUDA_VERSION=$(/opt/cuda/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p').0
    export CUDNN_MAJOR=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' /usr/include/cudnn_version.h)
    export CUDNN_MINOR=$(sed -n 's/^#define CUDNN_MINOR\s*\(.*\).*/\1/p' /usr/include/cudnn_version.h)
    export CUDNN_PATCH=$(sed -n 's/^#define CUDNN_PATCHLEVEL\s*\(.*\).*/\1/p' /usr/include/cudnn_version.h)
    export CUDNN_VERSION="${CUDNN_MAJOR}.${CUDNN_MINOR}.${CUDNN_PATCH}"
    export CUDA_COMPUTE_CAPABILITIES=sm_80,sm_86,sm_89,sm_90,compute_90

    # Override default version.
    export JAXLIB_RELEASE=$pkgver

    cd $srcdir/jax-jax-v$pkgver
    build/build.py build \
        --bazel_options='--action_env=JAXLIB_RELEASE' \
        --bazel_options="--action_env=TF_CUDA_COMPUTE_CAPABILITIES=${CUDA_COMPUTE_CAPABILITIES}" \
        --bazel_options="--repo_env=HERMETIC_CUDA_VERSION=${CUDA_VERSION}" \
        --bazel_options='--repo_env=LOCAL_NCCL_PATH=/usr' \
        --bazel_path=$srcdir/bazel-6.5.0-linux-x86_64 \
        --bazel_startup_options="--output_user_root=$srcdir/bazel"\
	--build_cuda_with_clang \
        --cuda_version=$CUDA_VERSION \
        --cudnn_version=$CUDNN_VERSION \
	--target_cpu_features=release \
	--verbose \
        --wheels=jaxlib,jax-cuda-plugin,jax-cuda-pjrt
}

package() {
    cd $srcdir/jax-jax-v$pkgver
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jaxlib-$pkgver-*.whl
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jax_cuda12_pjrt-$pkgver-*.whl
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jax_cuda12_plugin-$pkgver-*.whl
}
