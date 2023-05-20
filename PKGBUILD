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
pkgver=0.15.1
pkgrel=4
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
  ffmpeg4.4
  libjpeg-turbo
  libpng
)
optdepends=(
  'python-pycocotools: support for MS-COCO dataset'
)
makedepends=(
  cmake
  ninja
  rocm-hip-sdk
  python-setuptools
  qt5-base
  miopen-hip
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  'd6c1f55684a6d08b3501c4c166268684fbe8753fc034f8db7ddc1ee39efcff2ec39ce864cd97b95b784eb08345b999a928d5431d8d66bec82dc6f32ffd18c3bb'
)

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
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  if test -e build; then rm -rf build; fi
  mkdir build
  cd build

  # populate build architecture list if not set with defaults taken from
  # arch:community:python-pytorch-rocm@1.13.1
  if test -n "$PYTORCH_ROCM_ARCH"; then
    export PYTORCH_ROCM_ARCH="$PYTORCH_ROCM_ARCH"
  else
    export PYTORCH_ROCM_ARCH="gfx803;gfx900;gfx906;gfx908;gfx90a;gfx1030"
  fi

  cmake "../" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DWITH_PNG=ON \
    -DWITH_JPEG=ON
  make

  # fix bin/hipcc not found, because ROCM_HOME is lost
  # https://github.com/pytorch/vision/issues/6707#issuecomment-1269640873
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ROCM_HOME=/opt/rocm/ \
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
  provides+=(torchvision)
  conflicts+=(torchvision)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -C build install DESTDIR="$pkgdir"
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python-torchvision-rocm() {
  pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM support)'
  provides+=(python-torchvision)
  conflicts+=(python-torchvision)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  # fix bin/hipcc not found, because ROCM_HOME is lost
  FORCE_CUDA=1 \
    ROCM_HOME=/opt/rocm/ \
    TORCHVISION_INCLUDE=${srcdir} \
    TORCHVISION_LIBRARY=/usr/lib \
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
