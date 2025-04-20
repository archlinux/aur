# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib-cuda
pkgver=0.6.0
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/jax-ml/jax/'
license=('Apache-2.0')
groups=('jax')
depends=('cuda' 'cudnn' 'nccl' 'python-absl' 'python-ml-dtypes>=0.4.0'
	 'python-numpy' 'python-scipy')
makedepends=('clang18' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
provides=("python-jaxlib=$pkgver")
_bazel_ver=7.4.1
source=("jaxlib-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz"
        "bazel-${_bazel_ver}-linux-x86_64::https://github.com/bazelbuild/bazel/releases/download/${_bazel_ver}/bazel-${_bazel_ver}-linux-x86_64")
sha256sums=('07ec7a19c3a27c4cca88288f9e9477a62cd0b54bd43c4a77f497505ddadc72ed'
            'c97f02133adce63f0c28678ac1f21d65fa8255c80429b588aeeba8a1fac6202b')

prepare() {
    ln -sf $(readlink bazel-${_bazel_ver}-linux-x86_64) $srcdir/jax-jax-v${pkgver}/build
    chmod +x $srcdir/bazel-${_bazel_ver}-linux-x86_64
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
        --bazel_path="$srcdir/bazel-${_bazel_ver}-linux-x86_64" \
        --bazel_startup_options="--output_user_root=$srcdir/bazel"\
        --build_cuda_with_clang \
        --use_clang --clang_path='/usr/lib/llvm18/bin/clang' \
        --cuda_version=$CUDA_VERSION \
        --cudnn_version=$CUDNN_VERSION \
        --target_cpu_features=release \
        --verbose \
        --wheels=jaxlib,jax-cuda-plugin,jax-cuda-pjrt
}

package() {
    cd $srcdir/jax-jax-v$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jaxlib-$pkgver-*.whl
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jax_cuda12_pjrt-$pkgver-*.whl
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jax_cuda12_plugin-$pkgver-*.whl
}
