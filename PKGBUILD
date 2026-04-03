# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

# update when available in pytorch
_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.7;8.9;9.0;10.0;10.3;12.0;12.1;12.1+PTX"
_CUDA_ARCH_LIST_CMAKE="52;53;60;61;62;70;72;75;80;86;87;89;90;100;103;120;121;121-virtual"
_pkgname=vision
pkgbase='torchvision-cuda12.9'
pkgname=(torchvision-cuda12.9 python-torchvision-cuda12.9)
pkgver=0.26.0
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision (Maxwell/Pascal/Volta support)'
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
  cuda-12.9
  cudnn9.10-cuda12.9
  python-pytorch-opt-cuda12.9
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
        "fix-build.patch"
        "0001-Fix-setup.py-breaks-with-setuptools-82-9386.patch"
)
b2sums=('27c38e5876ec8ef1b80abbb9b650761cb91924b7cbdd4007f5a801851f7030c35d594351eefa17a3757b846781601d7135986ed394af25c6cdf7a9f81f8b5809'
        '30d09ff1511178e25c31c6ecee789c141179bb3cc34f37299d74891973a80a357a9f51a93cfa36834e29a0ba2a366b0974ee5cd88cb5f6a92f7553cd2cd80e98'
        '2532345be1043f7406bc0ec63ff758d11c1ab2f70b51392dfd26a23d15765f7993f8d140721951ec1ccd9a9e963e7bfb522f4df393908929adfe1104c6293dc8')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # https://github.com/pytorch/vision/issues/8307
  patch -p1 -i "${srcdir}"/fix-build.patch
  # Remove pkg_resources use
  patch -Np1 -i "${srcdir}"/0001-Fix-setup.py-breaks-with-setuptools-82-9386.patch

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
    # unlike other formats, libwebp is disabled by default
    -DWITH_WEBP=ON
  )

  echo "Building torchvision (GPU version with CUDA)"
  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  local _gpu_args=("${_common_cmake[@]}" -DWITH_CUDA=ON)
  cmake "${_gpu_args[@]}"
  cmake --build build

  # build python-torchvision-cuda
  echo "Building torchvision python bindings (GPU version with CUDA)"
  cd "${srcdir}/python-${_pkgname}-cuda-${pkgver}"
  TORCHVISION_INCLUDE="${srcdir}" \
  TORCHVISION_LIBRARY=/usr/lib \
  FORCE_CUDA=1 \
  TORCH_CUDA_ARCH_LIST="${_CUDA_ARCH_LIST}" \
  python -m build --wheel --no-isolation
}

package_python-torchvision-cuda12.9() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with GPU support)'
  depends+=(
    python
    python-numpy
    python-pillow
    python-pytorch-cuda12.9
  )
  optdepends+=(
    'python-pycocotools: support for MS-COCO dataset'
    'python-scipy: for specific datasets'
  )
  provides+=(python-torchvision python-torchvision-cuda)
  conflicts+=(python-torchvision)

  cd python-$_pkgname-cuda-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_torchvision-cuda12.9() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (C++ library only with GPU support)'
  depends+=(python-pytorch-cuda12.9)
  provides+=(torchvision torchvision-cuda)
  conflicts+=(torchvision)

  cd $_pkgname-cuda-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
