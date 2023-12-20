# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on python-torchvision; original contributors:
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname='vision'
pkgbase='python-torchvision-rocm'
pkgname=('torchvision-rocm' 'python-torchvision-rocm')
pkgver=0.16.2
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM support)'
arch=('x86_64')
url='https://github.com/pytorch/vision'
license=('BSD')
depends=(
  python-numpy
  python-pillow
  python-requests
  python-scipy
  python-typing_extensions
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
  'python-pytorch<2.1.2'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
  "pytorch-vision-8096.patch"
)
sha256sums=(
  '8c1f2951e98d8ada6e5a468f179af4be9f56d2ebc3ab057af873da61669806d7'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Fix build with ffmpeg 6.0
  patch -Np1 -i "${srcdir}/pytorch-vision-8096.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  if test -e build; then rm -rf build; fi
  mkdir build
  cd build

  # if not set, populate build architecture list from arch:python-pytorch-rocm@2.1.1-2
  if test -n "$GPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$GPU_TARGETS"; fi
  if test -n "$AMDGPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$AMDGPU_TARGETS"; fi
  if test -n "$PYTORCH_ROCM_ARCH"; then _PYTORCH_ROCM_ARCH="$PYTORCH_ROCM_ARCH"; fi
  if test -z "$_PYTORCH_ROCM_ARCH"; then _PYTORCH_ROCM_ARCH="gfx900;gfx906;gfx908;gfx90a;gfx1030;gfx1100;gfx1101;gfx1102"; fi
  export PYTORCH_ROCM_ARCH="${_PYTORCH_ROCM_ARCH}"

  # hardcode ROCM_PATH and HIP_ROOT_DIR to ROCM_HOME to /opt/rocm
  # fixes bin/hipcc not found, and others.
  export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
  export ROCM_PATH="$ROCM_HOME"
  export HIP_ROOT_DIR="$ROCM_HOME"

  cmake "../" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DWITH_PNG=ON \
    -DWITH_JPEG=ON
  make

  cd "${srcdir}/${_pkgname}-${pkgver}"
  TORCHVISION_INCLUDE=${srcdir} \
    TORCHVISION_LIBRARY=/usr/lib \
    TORCHVISION_USE_NVJPEG=0 \
    TORCHVISION_USE_VIDEO_CODEC=0 \
    TORCHVISION_USE_FFMPEG=1 \
    python setup.py build
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  # check if VideoReader is build
  # VideoReader depends on ffmpeg
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
    python -c "from torchvision.io import VideoReader"
}

package_torchvision-rocm() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only, with ROCM support)'
  provides+=(torchvision torchvision=${pkgver})
  conflicts+=(torchvision)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -C build install DESTDIR="$pkgdir"
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python-torchvision-rocm() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM support)'
  provides+=(python-torchvision python-torchvision=${pkgver})
  conflicts+=(python-torchvision)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  TORCHVISION_INCLUDE=${srcdir} TORCHVISION_LIBRARY=/usr/lib \
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
