# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on python-torchvision; original contributors:
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgname=python-torchvision-rocm
_pkgname='vision'
pkgver=0.13.0
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM GPU support)'
arch=('x86_64')
url='https://github.com/pytorch/vision'
license=('BSD')
depends=(
  ffmpeg4.4
  python-numpy
  python-pillow
  python-pytorch-rocm
  python-requests
  python-scipy
  python-typing_extensions
)
optdepends=(
  'libjpeg-turbo: support for JPEG image codec'
  'libpng: support for PNG format graphics files'
  'python-pycocotools: support for MS-COCO dataset'
)
makedepends=(
  miopen
  python-setuptools
  qt5-base
  rocm-hip-sdk
)
conflicts=(python-torchvision)
provides=(python-torchvision)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
  'force_disable_nvjpeg.patch'
)
sha512sums=(
  'e4ca6d3764b4114e5f485acf255021e18597715b8d7a53d700537c62a84ae1bb241c3cc561b86b236675973667a57ef8ca701657cb629a2ec9c8ae4bc023950e'
  'SKIP'
)

get_pyver() {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # workaround wrong nvjpeg detection
  patch -Np1 -i "${srcdir}/force_disable_nvjpeg.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  FORCE_CUDA=1 TORCHVISION_USE_NVJPEG=0 TORCHVISION_USE_VIDEO_CODEC=0 \
    CC=gcc CXX=g++ \
    python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  FORCE_CUDA=1 TORCHVISION_USE_NVJPEG=0 TORCHVISION_USE_VIDEO_CODEC=0 \
    CC=gcc CXX=g++ \
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
