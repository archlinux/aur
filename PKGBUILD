pkgname=tp_smapi-dkms
pkgver=0.44
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
sha256sums=('cccff96e8994bfc9dfe2bec071c4dfb6baf060f988bc338bbab95e639fd4c126'
            '43aa280c078fc5ba0ee229b9c71238e215313315711f3d3caae7b9bd0ab24dbe')

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
