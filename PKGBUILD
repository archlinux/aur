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
  rocm-toolchain
  rocminfo
)
provides=("python-$_name")
conflicts=("$pkgname-git")
source=("$pkgname::git+https://github.com/bitsandbytes-foundation/bitsandbytes.git#tag=${pkgver}")
sha512sums=("SKIP")

build() {
  cd $pkgname

  # Determine GPU targets
  GPU_TARGETS=$(rocm_agent_enumerator -t GPU)
  if [[ -n "$GPU_TARGETS" ]]; then
    echo "Building natively for enumerated GPU target: ${GPU_TARGETS}"
  else
    GPU_TARGETS="$(rocm-supported-gfx -e gfx950)"
    echo "Building in container for all supported GPU targets: ${GPU_TARGETS}"
  fi

  local cmake_options=(
    -W no-dev
    -S .
    -B .
    # Required to be picked up by python build
    -G "Unix Makefiles"
    -D CMAKE_BUILD_TYPE='Release'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D COMPUTE_BACKEND=hip
    # This won't actually do anything, just set it to silence a warning
    -D GPU_TARGETS=${GPU_TARGETS}
    # Actually used GPU targets
    -D CMAKE_HIP_ARCHITECTURES=${GPU_TARGETS}
  )
  cmake "${cmake_options[@]}"
  cmake --build .

  python -m build --wheel --no-isolation
}

package() {
  # Install license
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the python wheel
  python -m installer --destdir="$pkgdir" $pkgname/dist/*.whl
}
