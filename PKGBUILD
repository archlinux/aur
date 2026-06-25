# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

# update when available in pytorch
_CUDA_ARCH_LIST="7.5;8.0;8.6;8.7;8.9;9.0;10.0;10.3;11.0;12.0;12.1;12.1+PTX"
_CUDA_ARCH_LIST_CMAKE="75;80;86;87;89;90;100;103;110;120;121;121-virtual"
_pkgname=vision
pkgbase=torchvision
pkgname=(torchvision torchvision-cuda python-torchvision python-torchvision-cuda)
pkgver=0.27.1
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision'
arch=(x86_64)
url='https://github.com/pytorch/vision'
license=(BSD-3-Clause)
depends=(
  glibc
  libgcc
  libjpeg-turbo
  libpng
  libstdc++
  libwebp
)
makedepends=(
  cmake
  ninja
  cuda
  cudnn
  python-pytorch-opt-cuda
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
        "fix-build.patch"
)
b2sums=('c9c126f163ec1ceb0113ce930034af3abc88c68aae1ffe37500bdfd05a6d9c137822a0431b96e63bd6cf833d4d4356195169d2e14a600bd455848dddcd0421a6'
        '30d09ff1511178e25c31c6ecee789c141179bb3cc34f37299d74891973a80a357a9f51a93cfa36834e29a0ba2a366b0974ee5cd88cb5f6a92f7553cd2cd80e98')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # https://github.com/pytorch/vision/issues/8307
  patch -p1 -i "${srcdir}"/fix-build.patch

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
    # unlike other formats, libwebp is disabled by default
    -DWITH_WEBP=ON
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
  python -m build --wheel --no-isolation

  # build python-torchvision-cuda
  echo "Building torchvision python bindings (GPU version with CUDA)"
  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  TORCHVISION_INCLUDE="${srcdir}" \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
  python -m build --wheel --no-isolation
}

package_python-torchvision() {
  depends+=(
    python
    python-numpy
    python-pillow
    python-pytorch
  )
  optdepends+=(
    'python-pycocotools: support for MS-COCO dataset'
    'python-scipy: for specific datasets'
  )

  cd python-$_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-torchvision-cuda() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with GPU support)'
  depends+=(
    python
    python-numpy
    python-pillow
    python-pytorch-cuda
  )
  optdepends+=(
    'python-pycocotools: support for MS-COCO dataset'
    'python-scipy: for specific datasets'
  )
  provides+=(python-torchvision)
  conflicts+=(python-torchvision)

  cd python-$_pkgname-cuda-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_torchvision() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only)'
  depends+=(python-pytorch)

  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_torchvision-cuda() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only with GPU support)'
  depends+=(python-pytorch-cuda)
  provides+=(torchvision)
  conflicts+=(torchvision)

  cd $_pkgname-cuda-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
