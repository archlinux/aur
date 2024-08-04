# Maintainer: Winux <winux@winux.it>


pkgname=gv-usb2-driver-dkms-git
pkgver=r33.811fb0f
_pkgname=GV-USB2-Driver
pkgrel=2
pkgdesc="A linux driver for the IO-DATA GV-USB2 SD capture device. (DKMS)"
arch=(any)
url="https://github.com/Isaac-Lozano/GV-USB2-Driver"
license=('Dual BSD/GPL')
depends=('dkms')
source=("$_pkgname::git+$url"
        "alsa-index-selection.patch::https://patch-diff.githubusercontent.com/raw/Isaac-Lozano/GV-USB2-Driver/pull/9.patch"
        "dkms.conf")
sha256sums=('SKIP'
            'a1ad3bc3ca896efc9088fd8d7c17e99490636b9a46a68dc894153142c539c7dc'
            '5ab0645ebd5eecef239f09485edcccf6c9a033bc57fffe864c5575ba3f573609')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgname}-${pkgver}
  mkdir -p "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/patches
  cp -a $_pkgname/{*.{h,c},Makefile,.gitignore} "${pkgdir}"/usr/src/${_pkgname}-${pkgver}
  cp alsa-index-selection.patch "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/patches/
  cp dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  sed -e "s/@PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
