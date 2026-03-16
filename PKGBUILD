# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_name=bitsandbytes
pkgname=python-$_name-rocm
pkgdesc="Accessible large language models via k-bit quantization for PyTorch (ROCm version)"
license=("MIT")
url="https://github.com/bitsandbytes-foundation/$_name"
pkgver=0.49.2
pkgrel=1
arch=("x86_64")
depends=(
  hipblaslt
  hiprand
  hipsparse
  hipcub
  rocthrust
  python-setuptools
  python-pytest
  python-einops
  python-wheel
  python-scipy
  python-lion-pytorch
  python-pandas
  python-matplotlib
)
makedepends=(
  make
  cmake
)
provides=("python-$_name")
conflicts=("$pkgname-git")
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
