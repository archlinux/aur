pkgname=rtl8189es-dkms-git
_pkgbase=${pkgname%-*-*}
pkgver="42f2934"
pkgrel=1
pkgdesc="RTL8189ES / RTL8189ETV modules (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jwrdegoede/rtl8189ES_linux"
license=('GPL2')
depends=('dkms' 'bc') #'linux-headers'
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+${url}" 
        "dkms.conf")
md5sums=('SKIP'
         '9f3d65da70934f34f5b9eebf10387d4b')

package() {
  cd ${srcdir}/rtl8189ES_linux

  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

  if [ ${CARCH} == "armv6h" -o ${CARCH} == "armv7h" ]; then
     ARCH="arm"
  else
     ARCH=${CARCH}
  fi

  # Set name and version
  sed -e "s/@PACKAGE_NAME@/${_pkgbase}/" \
      -e "s/@DEST_MODULE_NAME@/${_pkgbase}/" \
      -e "s/@PACKAGE_VERSION@/${pkgver}/" \
      -e "s/@BUILT_MODULE_NAME@/8189es/" \
      -e "s/@ARCH@/$ARCH/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
