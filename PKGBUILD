# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on python-torchvision; original contributors:
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgname=python-torchvision-rocm
_pkgname='vision'
pkgver=0.12.0
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision (with ROCM GPU support)'
arch=('x86_64')
url='https://github.com/pytorch/vision'
license=('BSD')
depends=(
  python-typing_extensions
  python-numpy
  python-requests
  python-pillow
  python-scipy
  python-pytorch-rocm
  ffmpeg4.4
)
optdepends=(
  'python-pycocotools: support for MS-COCO dataset'
)
makedepends=(
  rocm-hip-sdk
  miopen
  python-setuptools
  qt5-base
)
conflicts=(python-torchvision)
provides=(python-torchvision)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/vision/archive/v${pkgver}.tar.gz"
  "5644.patch"
)
sha512sums=(
  'ebc48a9e9ef58cc93c1b095e565c67feb2bc1bf06551e8f891a0369c211c6732e10bf191298b0633a05664371fa6dc637aab851b01a57f6b3e0d5936e87ee8ae'
  '113f44dac9417b2cdfcdfb48ca4097083e73419ebf0619e747cb73f440536a1fd9f720d233ccd22309fff1968fe22975f1bc183abb567e0c67ef74765d3eca29'
)

get_pyver() {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # https://github.com/pytorch/vision/pull/5644
  # Attempt to fix FFMPEG 5.0 compatibility 
  patch -Np1 -i "${srcdir}/5644.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  FORCE_CUDA=1 CC=gcc CXX=g++ \
    python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  FORCE_CUDA=1 CC=gcc CXX=g++ \
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
