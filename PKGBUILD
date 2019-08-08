# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=python-jax-opt-cuda-git
pkgver=0.1.40.a6ec5a9
pkgrel=1
pkgdesc="Differentiate, compile, and transform Numpy code."
arch=("x86_64")
url="https://github.com/google/jax/"
license=("Apache")
depends=(
    "absl-py"
    "python"
    "python-numpy"
    "python-protobuf"
    "python-six"
    "python-fastcache"
    #"python-opt-einsum"
    "cuda"
    "cudnn"
)
conflicts=("python-jax")
provides=("python-jax")
makedepends=("git" "bazel")
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
