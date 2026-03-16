# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>
# Contributor : Lubosz Sarnecki <lubosz@gmail.com>

_name=bitsandbytes
pkgname=python-$_name-rocm-git
pkgdesc="Lightweight wrapper around CUDA custom functions, in particular 8-bit optimizers, matrix multiplication (LLM.int8()), and quantization functions (official AMD ROCm branch)"
license=("MIT")
url="https://github.com/TimDettmers/$_name"
pkgver=0.50.0.dev0.1115.925d83e4
pkgrel=1
arch=("x86_64")
makedepends=("make" "cmake")
depends=("hipblaslt" "hiprand" "hipsparse" "hipcub" "rocthrust" "python-setuptools" "python-pytest" "python-einops" "python-wheel" "python-scipy" "python-lion-pytorch" "python-pandas" "python-matplotlib")
provides=("python-$_name")
source=("$pkgname::git+https://github.com/bitsandbytes-foundation/bitsandbytes.git")
sha512sums=("SKIP")


pkgver() {
  cd $pkgname

  ver=$(grep __version__ bitsandbytes/__init__.py | grep -Po '(?<=").*(?=")')
  revision=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  echo $ver.$revision.$hash
}


build() {
  cd $pkgname

  cmake -DCOMPUTE_BACKEND=hip -S .
  make
  python -m build --wheel --no-isolation
}


package() {
  # Install license
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the python wheel
  python -m installer --destdir="$pkgdir" $pkgname/dist/*.whl
}
