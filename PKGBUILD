# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=dump1090-fa-git
_gitname=dump1090
pkgver=1.14.r42.ga3d26ea
pkgrel=2
pkgdesc="FlightAware fork of dump1090, a simple Mode S decoder for RTLSDR devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/dump1090"
license=('BSD')
depends=('rtl-sdr')
conflicts=('dump1090' 'dump1090-git' 'dump1090_mr-git')
provides=('dump1090' 'dump1090-fa')
makedepends=('git')
source=('dump1090::git+git://github.com/flightaware/dump1090'
	'dump1090.service')
md5sums=('SKIP'
         'ff76b23c833f50b37f2a15fe26b38d7a')
install='dump1090-fa.install'
 
pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
}

build() {
  cd "${srcdir}/${_gitname}"
  make PREFIX=/usr/
}
 
package() {
  # mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/${_gitname}/dump1090" "${pkgdir}/usr/bin/dump1090"
  install -D -m755 "${srcdir}/${_gitname}/view1090" "${pkgdir}/usr/bin/view1090"
  install -d -m755 "${pkgdir}/usr/share/dump1090/"
  install -D -m775 dump1090.service "${pkgdir}/usr/lib/systemd/system/dump1090.service"
  chmod -x "${pkgdir}/usr/lib/systemd/system/dump1090.service"
  cp -r "${srcdir}"/"${_gitname}"/public_html/* "${pkgdir}/usr/share/dump1090/"
}
