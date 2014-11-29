# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=iotop-git
pkgver=20141018
pkgrel=1
pkgdesc="Python program with a top like UI used to show of behalf of which process is the I/O going on"
arch=('any')
url="http://guichaz.free.fr/iotop/"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('iotop')
conflicts=('iotop')

source=()
md5sums=()

_gitroot=git://repo.or.cz/iotop.git
_gitname=iotop

prepare() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}"/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}"/$_gitname-build ] ; then
    rm -r "${srcdir}"/$_gitname-build
    cp -r "${srcdir}"/$_gitname "${srcdir}"/$_gitname-build
  else
    cp -r "${srcdir}"/$_gitname "${srcdir}"/$_gitname-build
  fi
}

package() {
  cd "${srcdir}"/$_gitname-build

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  mv "${pkgdir}"/usr/sbin "${pkgdir}"/usr/bin
}
