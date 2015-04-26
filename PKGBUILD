# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=piaware-git
_gitname=piaware
pkgver=1.18.1.r30.g43ca50a
pkgrel=1

pkgdesc="Client-side package and programs for forwarding ADS-B data to FlightAware"

arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/piaware"
license=('BSD')

depends=('dump1090_mr-git' 'tcl' 'tcllib' 'tclx' 'tk' 'tls')
makedepends=('git' 'autoconf' 'tcl')

source=('piaware::git+git://github.com/flightaware/piaware'
	'tcllauncher::git+git://github.com/flightaware/tcllauncher.git'
	'0001-Add-ability-to-specify-custom-install-prefix-for-pac.patch'
	'0002-Add-fix-for-adept-error-from-mutability-piaware.patch')
md5sums=('SKIP'
         'SKIP'
         '57d43fc9803c99bd7f32f882bf42fc08'
         'e8a43e9a5f22d52bb2c47168b00d92ac')
install=piaware-git.install

_gitname=piaware
_gitname2=tcllauncher 

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -p1 < ../0001-Add-ability-to-specify-custom-install-prefix-for-pac.patch
  patch -p1 < ../0002-Add-fix-for-adept-error-from-mutability-piaware.patch

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
