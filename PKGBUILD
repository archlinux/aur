pkgname=rtl8189es-dkms-git
_pkgbase=${pkgname%-*-*}
pkgver=89.e58bd86
pkgrel=2
pkgdesc="RTL8189ES / RTL8189ETV modules (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jwrdegoede/rtl8189ES_linux.git"
license=('GPL2')
depends=('dkms' 'bc') #'linux-headers'
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+${url}" 
        "dkms.conf")
md5sums=('SKIP'
         '55150e05b10b9d9a21c8cb9868d8c793')

pkgver() {
  cd ${srcdir}/rtl8189ES_linux
  printf '%s' "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/rtl8189ES_linux

  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

  if [ ${CARCH} == "armv6h" -o ${CARCH} == "armv7h" ]; then
     ARCH="arm"
  elif [ ${CARCH} == "aarch64" ]; then
     ARCH="arm64"
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
