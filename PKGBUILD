# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib-cuda
pkgver=0.9.0
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/jax-ml/jax'
license=('Apache-2.0')
groups=('jax')
depends=(
    'cuda'
    'cudnn'
    'nccl'
    'python-ml-dtypes'
    'python-numpy'
    'python-scipy'
)
makedepends=(
    'clang20'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
_bazel_ver=7.7.0
source=("jax-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz"
        "bazel-${_bazel_ver}-linux-x86_64::https://github.com/bazelbuild/bazel/releases/download/${_bazel_ver}/bazel-${_bazel_ver}-linux-x86_64"
        'bazelrc.sh')
noextract=("bazel-${_bazel_ver}-linux-x86_64")
sha256sums=('8525c72ac7ea01851297df5b25ca4622c65299c265c87dfe78420bb29e7b1bb3'
            'fe7e799cbc9140f986b063e06800a3d4c790525075c877d00a7112669824acbf'
            'SKIP')

prepare() {
    mkdir -p {base,cache,dist,repo,sandbox}

    ln -sf "$(readlink bazel-${_bazel_ver}-linux-x86_64)" "$srcdir/bazel"
    chmod +x $srcdir/bazel-${_bazel_ver}-linux-x86_64

    env -i srcdir="${srcdir}" envsubst < bazelrc.sh > bazelrc
}

build() {
    cd jax-jax-v$pkgver

    # Override default version.
    export JAXLIB_RELEASE=$pkgver

    ../bazel-${_bazel_ver}-linux-x86_64 --bazelrc=../bazelrc build \
        --repo_env=HERMETIC_PYTHON_VERSION=3.14 \
        //jaxlib/tools:jaxlib_wheel
}

package() {
    cd jax-jax-v$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        bazel-out/k8-opt/bin/jaxlib/tools/dist/jaxlib-${pkgver}*x86_64.whl
}
