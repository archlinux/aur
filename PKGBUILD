# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=piaware-git
_gitname=piaware
pkgver=2.1.2.r0.g5a453da
pkgrel=1

pkgdesc="Client-side package and programs for forwarding ADS-B data to FlightAware"

arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/piaware"
license=('BSD')

depends=('dump1090-fa' 'tcl' 'tcllib' 'tclx' 'tk' 'tls')
makedepends=('git' 'autoconf' 'tcl')

source=('piaware::git+git://github.com/flightaware/piaware'
	'tcllauncher::git+git://github.com/flightaware/tcllauncher.git')
md5sums=('SKIP'
         'SKIP')
install=piaware-git.install

_gitname=piaware
_gitname2=tcllauncher 

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname2}"
  autoconf
  ./configure 
#--prefix=${pkgdir}/usr --exec-prefix=${pkgdir}/usr
}

package() {
  cd "${srcdir}/${_gitname2}"
  make install DESTDIR=${pkgdir}

  mkdir -p "${pkgdir}/etc/systemd/system"
  cd "${srcdir}/${_gitname}"
  make install PREFIX=${pkgdir}

  mv "${pkgdir}/etc/systemd" "${pkgdir}/usr/lib/systemd"
  chmod -x "${pkgdir}/usr/lib/systemd/system/piaware.service"
  rmdir "${pkgdir}/etc"
}
