# Maintainer: 7Ji <pugokughin@gmail.com>
# Contributor: khvalera <khvalera[at]ukr[dot]net>
#   (Adapted from khvalera's rtl8189es-dkms-git package)

_modname='8189fs'
_pkgbase="rtl${_modname}"
pkgname="${_pkgbase}-dkms-git"
pkgver=102.75a566a
pkgrel=1
pkgdesc="RTL8189FS / RTL8189FTV modules (DKMS)"
arch=('x86_64' 'aarch64')
_srcname='rtl8189ES_linux'
url="https://github.com/jwrdegoede/${_srcname}.git"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=(
  "git+${url}#branch=${_pkgbase}"
  "dkms.conf"
)
sha256sums=(
  'SKIP'
  '1857422287efe715251bc9cd9a80973a026cc31df9e6637060dcdd17052305a8'
)

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf '%s' "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -pr * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  case "${CARCH}" in
    arm*)
      ARCH='arm'
      ;;
    aarch64)
      ARCH='arm64'
      ;;
    *)
      ARCH="${CARCH}"
      ;;
  esac

  # Set name and version
  sed -e "
    s/@PACKAGE_NAME@/${_pkgbase}/
    s/@DEST_MODULE_NAME@/${_pkgbase}/
    s/@PACKAGE_VERSION@/${pkgver}/
    s/@BUILT_MODULE_NAME@/${_modname}/
    s/@ARCH@/$ARCH/
    " -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}