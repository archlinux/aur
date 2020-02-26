# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=dump978-fa-git
_gitname=dump978
pkgver=3.8.0.r0.g5421a45
pkgrel=1
epoch=1
pkgdesc="FlightAware/Mutability fork of dump978, a simple Mode S decoder for RTLSDR devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/dump978"
license=('BSD')
depends=('rtl-sdr' 'bladerf>=2.0.2' 'soapyrtlsdr')
makedepends=('git')
source=('dump978::git+git://github.com/flightaware/dump978'
	'dump978.service')

sha256sums=('SKIP'
            '935798e1a09ea86ce7d25078b3dff400fd09ef9f0fec5e0e94636597f57f91b2')
pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags --match=v* | sed 's/dev.//g' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make all faup978 EXTRACFLAGS=-DHTMLPATH=\\\"/usr/share/dump978/html\\\"
}
 
package() {
  install -D -m755 "${srcdir}/${_gitname}/dump978-fa" "${pkgdir}/usr/bin/dump978-fa"
  install -D -m755 "${srcdir}/${_gitname}/skyaware978" "${pkgdir}/usr/bin/skyaware978"
  install -D -m755 "${srcdir}/${_gitname}/faup978" "${pkgdir}/usr/lib/piaware/helpers/faup978"
  install -D -m644 dump978.service "${pkgdir}/usr/lib/systemd/system/dump978.service"
}
