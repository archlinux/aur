# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor : anish [ at ] gatech [dot] edu

pkgname=dump978-fa-git
_gitname=dump978
pkgver=3.8.0.r0.g5421a45
pkgrel=1
epoch=1
pkgdesc="FlightAware/Mutability fork of dump978, a simple Mode S decoder for RTLSDR devices."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flightaware/dump978"
license=('BSD')
depends=('rtl-sdr' 'bladerf>=2.0.2' 'soapyrtlsdr' 'boost-libs')
makedepends=('git' 'boost')
backup=('etc/default/dump978')
source=('dump978::git+git://github.com/flightaware/dump978'
        'dump978.default'
        'dump978.sysusers'
	'dump978.service')
provides=("dump978=${pkgver}" "dump978-fa=${pkgver}")
conflicts=('dump978' 'dump978-fa')

sha256sums=('SKIP'
            '95b98905c6dc330392244aee324c13900392a09088d3075b69fb08df150f6930'
            '722bd9ee0bb6dad3f15e0e8c0d92c6fe405e6670ee150f6d799f124417ea30d7'
            'c95d8557432900d49bfa6f366419e9df22a5629a3c1f86135c15a8c28a6d4335')
pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags --match=v* | sed 's/dev.//g' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make all faup978 EXTRACFLAGS=-DHTMLPATH=\\\"/usr/share/dump978/html\\\"
}
 
package() {
  install -D -m 755 "${srcdir}/${_gitname}/dump978-fa" "${pkgdir}/usr/bin/dump978-fa"
  install -D -m 755 "${srcdir}/${_gitname}/skyaware978" "${pkgdir}/usr/bin/skyaware978"
  install -D -m 755 "${srcdir}/${_gitname}/faup978" "${pkgdir}/usr/lib/piaware/helpers/faup978"
  install -D -m 644 dump978.default "${pkgdir}/etc/default/dump978"
  install -D -m 644 dump978.sysusers "${pkgdir}/usr/lib/sysusers.d/dump978.conf"
  install -D -m 644 dump978.service "${pkgdir}/usr/lib/systemd/system/dump978.service"
}
