# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>
# Contributor: Pyro Devil <p.devil@gmail.com>

pkgname=exfat-dkms-git
_gitname=exfat-nofuse
pkgver=205.c0915bb
pkgrel=1
pkgdesc='Native (nofuse) kernel module for EXtendedFAT support - use with DKMS'
arch=('any')
url='https://github.com/barrybingo/exfat-nofuse'
license=('GPL2')
depends=('dkms' 'exfat-utils-nofuse')
makedepends=('git')
conflicts=('exfat' 'exfat-git')
options=('!strip')
source=('git+https://github.com/barrybingo/exfat-nofuse.git'
        dkms.conf)
b2sums=('SKIP'
        'b964beec9c31117d1b35373ea5f3fb4e14c736d69948ce8d438e08c8f7f9af3190eb510e3303249d8d323730f3d8924ce467f32c5724a9cb353ad91ab229d5f4')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" "${srcdir}"/dkms.conf
}

package() {
  # remove unneeded git files
  rm -fr ${_gitname}/{.git,.gitignore}

  install -dm644 "${pkgdir}"/usr/src
  cp -r ${_gitname} "${pkgdir}"/usr/src/exfat-${pkgver}
  install -Dm644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/exfat-${pkgver}/dkms.conf
}
