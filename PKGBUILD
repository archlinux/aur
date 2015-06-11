#Maintainer: superlex

#Contributor: Thomas Dziedzic < gostrc at gmail >
#Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

_pkgname=r5u87x
pkgname=r5u87x-hg
pkgver=64
pkgrel=8
pkgdesc='Userspace module for Ricoh R5U870 OEM cameras.'
arch=('i686' 'x86_64')
url='https://bitbucket.org/ahixon/r5u87x/'
license=('GPL2')
replaces=('r5u870')
makedepends=('mercurial' 'glib2' 'libusb-compat' 'pkgconfig')
depends=('glib2' 'libusb-compat')
optdepends=('guile')
install='r5u87x-hg.install'
source=("hg+https://bitbucket.org/ahixon/$_pkgname")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  # fix udev rule
  sed -i 's|#LOADER#|/usr/bin/r5u87x-loader|' \
contrib/90-r5u87x-loader.rules.in
}

build() {
  cd "$srcdir/$_pkgname"
  # set UCODE_PATH because we don't install to default location
  make UCODE_PATH=/usr/lib/firmware/r5u87x-%vid%-%pid%.fw
}

package() {
  cd "$srcdir/$_pkgname"

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/firmware
  install -d ${pkgdir}/etc/udev/rules.d

  install loader ${pkgdir}/usr/bin/r5u87x-loader
  install recode-fw.scm ${pkgdir}/usr/bin
  install -m644 ucode/*.fw ${pkgdir}/usr/lib/firmware
  install -m644 contrib/90-r5u87x-loader.rules ${pkgdir}/etc/udev/rules.d
}
