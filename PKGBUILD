# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on python-torchvision; original contributors:
# Contributor: Christian Heusel
# Contributor: Konstantin Gizdov
# Contributor: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname='vision'
# if not set, populate build architecture list from arch:python-pytorch@2.2.0-1
_PYTORCH_ROCM_ARCH="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102"
pkgbase='python-torchvision-rocm'
pkgname=('torchvision-rocm' 'python-torchvision-rocm')
pkgver=0.17.1
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM support)'
arch=('x86_64')
url='https://github.com/pytorch/vision'
license=('BSD-3-Clause')
depends=(
  numactl
  python-numpy
  python-pillow
  python-requests
  python-scipy
  python-sympy
  python-pytorch-rocm
  ffmpeg
  libjpeg-turbo
  libpng
)
makedepends=(
  cmake
  ninja
  rocm-hip-sdk
  python-setuptools
  qt6-base
  miopen-hip
)
conflicts=(
  'python-pytorch<2.2.0'
  'rocm-hip-sdk<6.0.0'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
  "pytorch-vision-8096.patch"
  "pytorch-vision-8112.patch"
  "torchvision-0_17_1-fix-build.patch"
)
sha256sums=(
  'a01c7bce4098c41b62cd3a08d87569113e25d12994b1370f0fd5f531952b6cef'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Fix build with ffmpeg 6.0
  patch -Np1 -i "${srcdir}/pytorch-vision-8096.patch"

  # Fix import torchvision after https://github.com/pytorch/pytorch/pull/113182
  # patch -Np1 -i "${srcdir}/pytorch-vision-8112.patch"

  # https://github.com/pytorch/vision/issues/8307
  patch -N -i "${srcdir}"/torchvision-0_17_1-fix-build.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  if test -e build; then rm -rf build; fi
  mkdir build

  if test -n "$GPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$GPU_TARGETS"; fi
  if test -n "$AMDGPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$AMDGPU_TARGETS"; fi
  if test -n "$PYTORCH_ROCM_ARCH"; then _PYTORCH_ROCM_ARCH="$PYTORCH_ROCM_ARCH"; fi
  export PYTORCH_ROCM_ARCH="${_PYTORCH_ROCM_ARCH}"
  echo "building for PYTORCH_ROCM_ARCH=$PYTORCH_ROCM_ARCH"

  # hardcode ROCM_PATH, HIP_ROOT_DIR, ROCM_HOME to /opt/rocm, fixes bin/hipcc a.o.
  export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
  export ROCM_PATH="$ROCM_HOME"
  export HIP_ROOT_DIR="$ROCM_HOME"

  cmake \
    -G Ninja \
    -Wno-dev \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DWITH_PNG=ON \
    -DWITH_JPEG=ON

  cmake --build build

  TORCHVISION_INCLUDE=${srcdir} \
    TORCHVISION_LIBRARY=/usr/lib \
    TORCHVISION_USE_NVJPEG=0 \
    TORCHVISION_USE_VIDEO_CODEC=0 \
    TORCHVISION_USE_FFMPEG=1 \
    python setup.py build
}

check() {
  # local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  # # check if VideoReader is build
  # # VideoReader depends on ffmpeg
  # cd "${srcdir}/${_pkgname}-${pkgver}"
  # PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
  #   python -c "from torchvision.io import VideoReader"
  true
}

package_torchvision-rocm() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only, with ROCM support)'
  provides+=(torchvision torchvision=${pkgver})
  conflicts+=(torchvision)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python-torchvision-rocm() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM support)'
  provides+=(python-torchvision python-torchvision=${pkgver})
  conflicts+=(python-torchvision)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  TORCHVISION_INCLUDE=${srcdir} \
    TORCHVISION_LIBRARY=/usr/lib \
    FORCE_CUDA=1 \
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
