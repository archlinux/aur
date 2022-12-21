# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=piaware-git
_gitname=piaware
pkgver=8.2.r0.g711c9ad
pkgrel=1

pkgdesc="Client-side package and programs for forwarding ADS-B data to FlightAware"

arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flightaware/piaware"
license=('BSD')

depends=('dump1090-fa-git>=6.1' 'tcl' 'tcllib' 'tclx' 'tk' 'tcltls>=1.7.12' 'python' 'tcllauncher')
makedepends=('git' 'autoconf' 'tcl' 'python' 'tcllauncher')
optdepends=('mlat-client: M-LAT support' 'net-tools')

source=('piaware::git+https://github.com/flightaware/piaware'
        'piaware.conf')
md5sums=('SKIP'
         'fc8d49cd7b2ba136a097501647ed105b')
install=piaware-git.install
backup=('etc/piaware.conf')

_gitname=piaware

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  #patch -Np0 < ../fixtclver.patch
}

package() {

  install -D /usr/bin/tcllauncher "${pkgdir}"/usr/bin/tcllauncher
  cd "${srcdir}/${_gitname}"
  make install DESTDIR="${pkgdir}" SYSTEMD=/usr/lib/systemd/system
  rm "${pkgdir}"/usr/bin/tcllauncher

  install -dm755 "${pkgdir}"/var/cache/piaware
  install -dm750 "${pkgdir}"/etc/sudoers.d/
  install -Dm644 etc/piaware.sudoers "${pkgdir}"/etc/sudoers.d/01piaware
  install -Dm640 "${srcdir}"/piaware.conf "${pkgdir}"/etc/piaware.conf
  chmod -x "${pkgdir}/usr/lib/systemd/system/piaware.service"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
