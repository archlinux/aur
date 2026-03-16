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
  libgcc
  libstdc++
  glibc
  hipblas
  libgomp
  hipblaslt
  hipsparse
  hiprand
  hipcub
  python
  python-triton
  python-scipy
  python-pytorch
  python-numpy
  python-typing_extensions
  python-packaging
)
makedepends=(
  git
  make
  cmake
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-scikit-build-core
  python-trove-classifiers
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
