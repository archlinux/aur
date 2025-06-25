pkgname=tp_smapi-dkms
pkgver=0.45
pkgrel=1
pkgdesc="DKMS controlled modules for ThinkPad's SMAPI functionality"
arch=(any)
url="http://www.thinkwiki.org/wiki/Tp_smapi"
license=('GPL')
depends=('dkms')
conflicts=('tp_smapi')
provides=("tp_smapi=${pkgver}")
options=(!strip)
source=("https://github.com/linux-thinkpad/tp_smapi/releases/download/tp-smapi%2F${pkgver}/tp_smapi-${pkgver}.tgz"
        'dkms.conf')
sha256sums=('627b15affc3ed993d633be1421b66db8c96789464390029b86bb16b00239bb24'
            'e5874442a51bc1cb0c90c6e9289ebe4b1cccf4ea60716c823d0beaa5ce1b361b')

prepare() {
  cd tp_smapi-${pkgver}
  msg2 "Patching dkms.conf"
  sed -ri 's/^(PACKAGE_VERSION=).*/\1'${pkgver}'/g' "${srcdir}"/dkms.conf
}

package() {
  mkdir -p "${pkgdir}"/usr/src/${pkgname}-${pkgver}
  cp -a tp_smapi-${pkgver}/{*.{h,c},Makefile} "${pkgdir}"/usr/src/${pkgname}-${pkgver}
  cp dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}

  sed -e "s/@PKGNAME@/${pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  sed -i 's/KVER/KERNELRELEASE/g' "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}

# vim: set et sw=2 sts=2:
