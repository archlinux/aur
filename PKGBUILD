# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=piaware-git
_gitname=piaware
pkgver=3.7.0.1.r6.gc240b21
pkgrel=1

pkgdesc="Client-side package and programs for forwarding ADS-B data to FlightAware"

arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/piaware"
license=('BSD')

depends=('dump1090-fa-git' 'tcl' 'tcllib' 'tclx' 'tk' 'tcltls>=1.7.12' 'python' 'tcllauncher')
makedepends=('git' 'autoconf' 'tcl' 'python' 'tcllauncher')
optdepends=('mlat-client: M-LAT support' 'net-tools')

source=('piaware::git+git://github.com/flightaware/piaware#branch=dev'
        'piaware.conf'
        'fixtclver.patch')
md5sums=('SKIP'
         'fc8d49cd7b2ba136a097501647ed105b'
         '4b6ca0410da2a93ce00b97f5222b8d57')
install=piaware-git.install
backup=('etc/piaware.conf')

_gitname=piaware

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -Np0 < ../fixtclver.patch
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
