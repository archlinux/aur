# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_name=bitsandbytes
pkgname=python-$_name-rocm
pkgdesc="Lightweight wrapper around CUDA custom functions, in particular 8-bit optimizers, matrix multiplication (LLM.int8()), and quantization functions (official AMD ROCm branch)"
license=("MIT")
url="https://github.com/TimDettmers/$_name"
pkgver=0.49.2
pkgrel=1
arch=("x86_64")
makedepends=("make" "cmake")
depends=("hipblaslt" "hiprand" "hipsparse" "hipcub" "rocthrust" "python-setuptools" "python-pytest" "python-einops" "python-wheel" "python-scipy" "python-lion-pytorch" "python-pandas" "python-matplotlib")
provides=("python-$_name")
source=("$pkgname::git+https://github.com/bitsandbytes-foundation/bitsandbytes.git#tag=${pkgver}")
sha512sums=("SKIP")

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
