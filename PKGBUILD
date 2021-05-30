pkgname=tp_smapi-dkms
pkgver=0.43
pkgrel=4
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
        'kbase.patch')
sha256sums=('bcef9cd045d52a74d719b2a67ac4f5324994a856f123c0fbc55f1d769d367110'
            '43aa280c078fc5ba0ee229b9c71238e215313315711f3d3caae7b9bd0ab24dbe'
            '4bcce516a9f3c486a934cfe6e3d3c92443833f4094ec008ce25264d1a5b66097')

prepare() {
  cd tp_smapi-${pkgver}
  # patch Makefile for recent kernel module directory change
  patch -p2 < "${srcdir}"/kbase.patch
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
