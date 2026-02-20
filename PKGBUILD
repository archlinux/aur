# Maintainer: idovitz <ido at idiv dot nl>

_pkgname=amdisp4
pkgname=amdisp4-dkms
pkgver=8
pkgrel=1
pkgdesc="AMD ISP4 and camera subsystem driver (part of AMD Ryzen AI Max 300 Series), stripped patches for dkms"
arch=('x86_64')
url="https://github.com/idovitz/amdisp4"
license=('GPL2')
depends=('dkms')
conflicts=()
source=('https://github.com/idovitz/amdisp4/archive/refs/tags/'${pkgver}'.tar.gz')

b2sums=('bd6af2ffe0899fd6fb81726e3828265b6ca9bae8925848eceb5181c5e624214cf4584211762feff59fdd459726653e8953d44c04f1938c72178014004f82c978')

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
