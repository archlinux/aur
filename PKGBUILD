# Maintainer: idovitz <ido at idiv dot nl>

_pkgname=amdisp4
pkgname=amdisp4-dkms
pkgver=6
pkgrel=1
pkgdesc="AMD ISP4 and camera subsystem driver (part of AMD Ryzen AI Max 300 Series), stripped patches for dkms"
arch=('x86_64')
url="https://github.com/idovitz/amdisp4"
license=('GPL2')
depends=('dkms')
conflicts=()
source=('https://github.com/idovitz/amdisp4/archive/refs/tags/6.tar.gz')

b2sums=('1317c48409ce479fb9077854541853cde584c41a1acc2a102b2cf8aeb506e46e15b1858bbbe636140c5560b48071ad7d25c3e35331941ac62b5d0bf0b43b9978')

prepare (){
  cd "${srcdir}"/${_pkgname}-${pkgver}/
  pwd
  for patch in patches/*.patch; do
    echo $patch;
    patch -p1 < $patch
  done
}

package() {
  # Copy dkms.conf
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
  cp "${srcdir}/${_pkgname}-${pkgver}"/drivers/media/platform/amd/isp4/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/Makefile "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/Makefile

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
