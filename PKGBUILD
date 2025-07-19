# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>
#
# NOTE:
# to build with GPU decoder, we use nvidia-sdk header files from https://github.com/NVIDIA/DALI for convenience
# you could also use https://aur.archlinux.org/packages/nvidia-sdk
# just update environment variable `TORCHVISION_INCLUDE` and `TORCHVISION_LIBRARY`
# see also https://github.com/pytorch/vision/blob/main/torchvision/csrc/io/decoder/gpu/README.rst
# See this to find the location of nvcuvid.h and cuviddec.h headers in the DALI project:
# https://github.com/NVIDIA/DALI/blob/4d95a057199a09590490b2d99ae0b9948655e07d/internal_tools/stub_generator/nvcuvid.json#L4-L5

# update when available in pytorch
_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.9;9.0;9.0+PTX"
_CUDA_ARCH_LIST_CMAKE="52-real;53-real;60-real;61-real;62-real;70-real;72-real;75-real;80-real;86-real;89-real;89-virtual;90-real;90-virtual"
_pkgname=vision
pkgbase='torchvision'
pkgname=('torchvision' 'torchvision-cuda' 'python-torchvision' 'python-torchvision-cuda')
pkgver=0.22.1
pkgrel=2
pkgdesc='Datasets, transforms, and models specific to computer vision'
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
)
optdepends=(
  'ffmpeg: video reader backend (the recommended one with better performance)'
  'python-pycocotools: support for MS-COCO dataset'
)
makedepends=(
  cmake
  ninja
  cuda
  cudnn
  ffmpeg
  python-pytorch-opt-cuda
  python-build
  python-installer
  python-setuptools
  python-wheel
  qt5-base
  nvidia-utils
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
        "https://github.com/NVIDIA/DALI/raw/main/dali/operators/video/dynlink_nvcuvid/cuviddec.h"
        "https://github.com/NVIDIA/DALI/raw/main/dali/operators/video/dynlink_nvcuvid/nvcuvid.h"
        "torchvision-0_17_1-fix-build.patch"
)
b2sums=('79ccb41de26c23da4c59a478e208b93b2de540baddaf05d0545f40d70d2e1307c96937abbc276f72d1fcad0e397da0681d90f1e4790f80f894889f9eb62841a9'
        '9ccff204a4e1e93340d8b12c2b1d17e01663c12957b4665c0043eccf76d507a7308745a5d9e4d89657840aaf8abf0aa8f51bd79d6e0d5dc57a376d54a754755a'
        '7db5d621f3099bc5455f1faeb7f4c3575a9cf70153ba56a6efc6d67d0ef2ac5438f6e117e621c5ef35c239eb3bce3fe17ce160e6b7765e8203d67a7299085429'
        'b2036b9f4102c50cbcf6813e4a5c46d2899c11ab8d20236eadb5ac1f88d927ee0fb809c880ca3ad9194efa8df665a47d05085b5352b804dabe8925836ecfd0f7')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # https://github.com/pytorch/vision/issues/8307
  patch -N -i "${srcdir}"/torchvision-0_17_1-fix-build.patch

  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-cuda-${pkgver}"
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/python-${_pkgname}-${pkgver}"
  # need this to disable CUDA
  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  sed -e 's#torch.cuda.is_available()#False#' -i setup.py
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
}

build() {
  # We have pass the cuda archs to all builds as cmake files included by
  # python-pytorch-cuda process them.
  local _common_cmake=(
    -G Ninja
    -Wno-dev
    -B build
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3"
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}"
    -DTORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}"
    -DCUDA_ARCH_LIST="${_CUDA_ARCH_LIST}"
    -DCMAKE_CUDA_ARCHITECTURES="${_CUDA_ARCH_LIST_CMAKE}"
    -DUSE_SYSTEM_NVTX=ON
  )

  echo "Building torchvision (CPU version)"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _cpu_args=("${_common_cmake[@]}" -DWITH_CUDA=OFF)
  cmake "${_cpu_args[@]}"
  cmake --build build

  echo "Building torchvision (GPU version with CUDA)"
  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  local _gpu_args=("${_common_cmake[@]}" -DWITH_CUDA=ON)
  cmake "${_gpu_args[@]}"
  cmake --build build

  # build python-torchvision
  echo "Building torchvision python bindings (CPU version)"
  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  WITH_CUDA=0 \
  FORCE_CUDA=0 \
  TORCHVISION_USE_NVJPEG=0 \
  python setup.py build


  # build python-torchvision-cuda
  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  TORCHVISION_INCLUDE="${srcdir}" \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
  python setup.py build
}

# TODO(gromit): re-enable the tests
# check() {
#   local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#   # check if VideoReader is build
#   # VideoReader depends on ffmpeg
#   cd "${srcdir}/python-${_pkgname}-${pkgver}"
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
#   python -c "from torchvision.io import VideoReader"

#   cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
#   python -c "from torchvision.io import VideoReader"
# }

package_python-torchvision() {
  depends+=('python-pytorch')

  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-torchvision-cuda() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with GPU support)'
  depends+=('python-pytorch-cuda')
  provides+=('python-torchvision')
  conflicts+=('python-torchvision')

  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  TORCHVISION_INCLUDE="${srcdir}" \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_torchvision() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only)'
  depends+=('python-pytorch')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
package_torchvision-cuda() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only with GPU support)'
  depends+=('python-pytorch-cuda')
  provides+=('torchvision')
  conflicts+=('torchvision')

  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
