# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.8.2
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/jax-ml/jax'
license=('Apache-2.0')
groups=('jax')
depends=(
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
_bazel_ver=7.4.1
source=("jax-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz"
        "bazel-${_bazel_ver}-linux-x86_64::https://github.com/bazelbuild/bazel/releases/download/${_bazel_ver}/bazel-${_bazel_ver}-linux-x86_64"
        'bazelrc')
noextract=("bazel-${_bazel_ver}-linux-x86_64")
sha256sums=('f7e5080c97c1aaffb490a17d174cb59a83dd037800d9c41d309287bebd15b0b8'
            'c97f02133adce63f0c28678ac1f21d65fa8255c80429b588aeeba8a1fac6202b'
            'SKIP')

prepare() {
    mkdir -p {base,cache,dist,repo,sandbox}

    ln -sf "$(readlink bazel-${_bazel_ver}-linux-x86_64)" "$srcdir/bazel"
    chmod +x $srcdir/bazel-${_bazel_ver}-linux-x86_64
}

build() {
    cd jax-jax-v$pkgver

    # Override default version.
    export JAXLIB_RELEASE=$pkgver

    ../bazel-7.4.1-linux-x86_64 --bazelrc=../bazelrc build \
        --repo_env=HERMETIC_PYTHON_VERSION=3.14 \
        //jaxlib/tools:jaxlib_wheel
}

package() {
    cd jax-jax-v$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        bazel-out/k8-opt/bin/jaxlib/tools/dist/jaxlib-${pkgver}*x86_64.whl
}
