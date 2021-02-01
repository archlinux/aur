# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=python-jax-opt-cuda-git
pkgver=0.2.9.26afe307
pkgrel=1
pkgdesc="Differentiate, compile, and transform Numpy code."
arch=("x86_64")
url="https://github.com/google/jax/"
license=("Apache")
depends=(
    "absl-py"
    "cuda"
    "cudnn"
    "python"
    "python-numpy"
    "python-opt_einsum"
    "python-scipy"
    "python-six"
)
conflicts=("python-jax")
provides=("python-jax")
makedepends=(
    # By now jaxlib building requires bazel of version 3.1.0. The issue is that
    # version of community/bazel is 4.0.0. So, we need to remove bazel from
    # makedepends until jax maintainers update required bazel version.
    #"bazel"
    "git"
    "python-wheel"
)
source=(
    "$pkgname::git+$url"
)
md5sums=(
    "SKIP"
)

pkgver() {
  cd $pkgname
  python -c "with open('jax/version.py') as fin: exec(fin.read(), globals()); print(__version__+ '.`git rev-list -n1 --abbrev-commit HEAD`')"
}

build() {
  cd $pkgname
  TF_CUDA_PATHS=/usr,/opt/cuda python build/build.py --enable_cuda --enable_march_native
}

package() {
  cd $pkgname
  (cd build && python setup.py install --optimize=1 --root=$pkgdir)
  (python setup.py install --optimize=1 --root=$pkgdir)
}
