# Maintainer: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=daemonize-git
_pkgname=daemonize
pkgver=r81.18869a7
pkgrel=1
pkgdesc="Command-line utility for running any arbitrary program as a Unix daemon"
url="http://software.clapper.org/daemonize/"
arch=('x86_64')
makedepends=('git')
depends=('glibc')
license=('BSD')
provides=("daemonize")

source=($_pkgname::git+https://github.com/bmc/daemonize.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  cd ${srcdir}/${_pkgname}
  ./configure --prefix=/usr
  make || return 1

}

package() {
#install package
  cd ${srcdir}/${_pkgname}
  make DESTDIR=$pkgdir install

  # move things to /usr/bin instead of /usr/sbin

  install -d ${pkgdir}/usr/bin
  mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin/
  rmdir ${pkgdir}/usr/sbin
  
  #install licence
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE.md ${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE
}
