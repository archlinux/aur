pkgname=tp_smapi-dkms
pkgver=0.44
pkgrel=3
pkgdesc="DKMS controlled modules for ThinkPad's SMAPI functionality"
arch=(any)
url="http://www.thinkwiki.org/wiki/Tp_smapi"
license=('GPL')
depends=('dkms')
conflicts=('tp_smapi')
provides=("tp_smapi=${pkgver}")
options=(!strip)
source=("https://github.com/linux-thinkpad/tp_smapi/releases/download/tp-smapi%2F${pkgver}/tp_smapi-${pkgver}.tgz"
        'dkms.conf'
        'PR_71.patch')
sha256sums=('cccff96e8994bfc9dfe2bec071c4dfb6baf060f988bc338bbab95e639fd4c126'
            'e5874442a51bc1cb0c90c6e9289ebe4b1cccf4ea60716c823d0beaa5ce1b361b'
            '78127017644e0642ecf16d52f43ea2800cedf85e767ee8ff5dbac5236a91ba3a')

prepare() {
  cd tp_smapi-${pkgver}
  msg2 "Patching dkms.conf"
  sed -ri 's/^(PACKAGE_VERSION=).*/\1'${pkgver}'/g' "${srcdir}"/dkms.conf
  msg2 "Patching tp_smapi for 6.15+ support"
  patch -p1 < ../PR_71.patch
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
