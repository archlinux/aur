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
_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.7;8.9;9.0;10.0;10.3;12.0;12.1;12.1+PTX"
_CUDA_ARCH_LIST_CMAKE="52;53;60;61;62;70;72;75;80;86;87;89;90;100;103;120;121;121-virtual"
_pkgname=vision
pkgbase='torchvision-cuda12.9'
pkgname=('torchvision-cuda12.9' 'python-torchvision-cuda12.9')
pkgver=0.23.0
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision (Maxwell/Pascal/Volta support)'
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
  cuda-12.9
  cudnn9.10-cuda12.9
  ffmpeg
  python-pytorch-opt-cuda12.9
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
        "nppiNV12ToRGB_709CSC_8u_P2C3R_Ctx.patch"
        ffmpeg-8.patch
)
b2sums=('601c47ff313bbf94fe2d2afd3dba4cbd4167ef6b8a5c53010636bc550fdcd76ae92d0c5a97156bfa039d5a7baad229132f320dc7355a282c073debbb667ea153'
        '9ccff204a4e1e93340d8b12c2b1d17e01663c12957b4665c0043eccf76d507a7308745a5d9e4d89657840aaf8abf0aa8f51bd79d6e0d5dc57a376d54a754755a'
        '7db5d621f3099bc5455f1faeb7f4c3575a9cf70153ba56a6efc6d67d0ef2ac5438f6e117e621c5ef35c239eb3bce3fe17ce160e6b7765e8203d67a7299085429'
        'b2036b9f4102c50cbcf6813e4a5c46d2899c11ab8d20236eadb5ac1f88d927ee0fb809c880ca3ad9194efa8df665a47d05085b5352b804dabe8925836ecfd0f7'
        '2b79f639b4526f5bd3d0cc5fab0d65ca7284a43a8652c831352bf6574ec8c786245ab76704a5b469bfcee125bc3a7cf0c88771367798a3ef6736d47bdd4d0a83'
        'a18c5f8a5f271957516db90e5f16b98e22c251e22739c7af6f4cf3d8c50206fe6b678574c785a4de20a5e9c510e7607db02159255cf5cf8016137d2b79016398')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # https://github.com/pytorch/vision/issues/8307
  patch -N -i "${srcdir}"/torchvision-0_17_1-fix-build.patch

  # Fix build with CUDA 13 https://github.com/pytorch/vision/pull/9224
  patch -p1 -i "${srcdir}"/nppiNV12ToRGB_709CSC_8u_P2C3R_Ctx.patch

  # Fix build with ffmpeg 8
  patch -p1 -i "${srcdir}"/ffmpeg-8.patch

  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-cuda-${pkgver}"
  mv "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
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

  echo "Building torchvision (GPU version with CUDA)"
  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  local _gpu_args=("${_common_cmake[@]}" -DWITH_CUDA=ON)
  cmake "${_gpu_args[@]}"
  cmake --build build

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

package_python-torchvision-cuda12.9() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with GPU support)'
  depends+=('python-pytorch-cuda12.9')
  provides+=('python-torchvision' 'python-torchvision-cuda')
  conflicts+=('python-torchvision')

  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  TORCHVISION_INCLUDE="${srcdir}" \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_torchvision-cuda12.9() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only with GPU support)'
  depends+=('python-pytorch-cuda12.9')
  provides+=('torchvision' 'torchvision-cuda')
  conflicts+=('torchvision')

  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
