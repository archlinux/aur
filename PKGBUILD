# Maintainer: idovitz <ido at idiv dot nl>

_pkgname=amdisp4
pkgname=amdisp4-dkms
pkgver=7
pkgrel=1
pkgdesc="AMD ISP4 and camera subsystem driver (part of AMD Ryzen AI Max 300 Series), stripped patches for dkms"
arch=('x86_64')
url="https://github.com/idovitz/amdisp4"
license=('GPL2')
depends=('dkms')
conflicts=()
source=('https://github.com/idovitz/amdisp4/archive/refs/tags/'${pkgver}'.tar.gz')

b2sums=('2dd2044ce507897414006465178ed3436de718a9fe9ff3046aecf8cfdc886c9c3d844fe7a61f6712e012266e0668995662b4c5b512e447ddacd5ccb14505b4fd')

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
