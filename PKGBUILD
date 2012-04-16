# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

pkgname=cloudprint-cups-git
pkgver=20120416
pkgrel=1
pkgdesc="Google Cloud Print driver for CUPS, allows printing to printers hosted on Google Cloud Print."
arch=('any')
url="https://github.com/simoncadman/CUPS-Cloud-Print"
license=('GPL3')
depends=('pycups')
makedepends=('cups' 'git')
provides=('cloudprint-cups')
conflicts=('cloudprint-cups')

_gitroot="git://github.com/simoncadman/CUPS-Cloud-Print.git"
_gitname="CUPS-Cloud-Print"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin master
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  if [[ -e ${srcdir}/${_gitname}-build ]]; then rm -rf ${srcdir}/${_gitname}-build; fi
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  ./configure --prefix /usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
  rm ${pkgdir}/var/log/cups/cloudprint_log
}
