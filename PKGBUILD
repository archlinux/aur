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
#

# update when available in pytorch
_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.9;8.9+PTX" #;9.0;9.0+PTX"
_CUDA_ARCH_LIST_CMAKE="52-real;53-real;60-real;61-real;62-real;70-real;72-real;75-real;80-real;86-real;89-real;89-virtual" #;90-real;90-virtual"
_pkgname=vision
pkgbase='torchvision'
pkgname=('torchvision' 'torchvision-cuda' 'python-torchvision' 'python-torchvision-cuda')
pkgver=0.14.1
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision'
arch=('x86_64')
url='https://github.com/pytorch/vision'
license=('BSD')
depends=(
  python-numpy
  python-pillow
  python-requests
  python-scipy
)
optdepends=(
  'ffmpeg4.4: video reader backend (the recommended one with better performance)'
  'python-pycocotools: support for MS-COCO dataset'
)
makedepends=(
  cmake
  ninja
  cuda
  ffmpeg4.4
  python-pytorch-opt-cuda
  python-setuptools
  qt5-base
  nvidia-utils
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
        "https://github.com/NVIDIA/DALI/raw/main/dali/operators/reader/loader/video/nvdecode/cuviddec.h"
        "https://github.com/NVIDIA/DALI/raw/main/dali/operators/reader/loader/video/nvdecode/nvcuvid.h"
)
b2sums=('0708635b00ac7c2cf4e54799f1190f01f3240f53233695819f691313b8a369b8922520e2f3cf96184bab671877b5826b84e0936d9ca5b58004d6e2a098c6cbbf'
        '9ccff204a4e1e93340d8b12c2b1d17e01663c12957b4665c0043eccf76d507a7308745a5d9e4d89657840aaf8abf0aa8f51bd79d6e0d5dc57a376d54a754755a'
        '7db5d621f3099bc5455f1faeb7f4c3575a9cf70153ba56a6efc6d67d0ef2ac5438f6e117e621c5ef35c239eb3bce3fe17ce160e6b7765e8203d67a7299085429')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # fix building with ffmpeg4.4 by manually setup include and lib dir
  # and remove other codes to find ffmpeg exe, as ffmpeg4.4 are only headers and libs without ffmpeg cmd
  sed -e 's#ffmpeg_include_dir = os.path.join(ffmpeg_root, "include")#ffmpeg_include_dir = "/usr/include/ffmpeg4.4"#' \
      -e 's#ffmpeg_library_dir = os.path.join(ffmpeg_root, "lib")#ffmpeg_library_dir = "/usr/lib/ffmpeg4.4"#' \
      -e 's#has_ffmpeg = ffmpeg_exe is not None#has_ffmpeg = True#' \
      -e '/ffmpeg_exe/d' \
      -e '/ffmpeg_bin/d' \
      -e '/ffmpeg_root/d' \
      -i setup.py

  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-cuda-${pkgver}"
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/python-${_pkgname}-${pkgver}"
  # need this to disable CUDA
  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  sed -e 's#torch.cuda.is_available()#False#' -i setup.py
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
}

build() {
  # build torchvision
  cd "${srcdir}/${_pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build

  cmake "../" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DWITH_CUDA=OFF
  make


  # build torchvision-cuda
  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  rm -rf build
  mkdir build
  cd build

  cmake "../" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DWITH_CUDA=ON \
    -DTORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
    -DCUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
    -DCMAKE_CUDA_ARCHITECTURES="${_CUDA_ARCH_LIST_CMAKE}"
  make


  # build python-torchvision
  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  WITH_CUDA=0 \
  FORCE_CUDA=0 \
  TORCHVISION_USE_NVJPEG=0 \
  python setup.py build


  # build python-torchvision-cuda
  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  TORCHVISION_INCLUDE=${srcdir} \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST=${_CUDA_ARCH_LIST} \
  python setup.py build
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  # check if VideoReader is build
  # VideoReader depends on ffmpeg
  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
  python -c "from torchvision.io import VideoReader"

  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
  python -c "from torchvision.io import VideoReader"
}

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
  TORCHVISION_INCLUDE=${srcdir} \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST=${_CUDA_ARCH_LIST} \
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_torchvision() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only)'
  depends+=('python-pytorch-cuda')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -C build install DESTDIR="$pkgdir"
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
package_torchvision-cuda() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only with GPU support)'
  depends+=('python-pytorch-cuda')
  provides+=('torchvision')
  conflicts+=('torchvision')

  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  make -C build install DESTDIR="$pkgdir"
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
