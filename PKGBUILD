# Maintainer: Dan Schaper <dschaper at ganymeade dot com>

pkgname=dump1090-mutability-git
_pkgbase=dump1090-mutability
pkgver=faup1090.2.1.3.r1.gc55c71b
pkgrel=1
pkgdesc="ADS-B / Mode S Ground Station System for simple RTL-SDR decoding/translating. Mutability Fork"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url=("https://github.com/mutability/dump1090")
license=('GPL' 'BSD')
depends=('rtl-sdr')
makedepends=('git')
provides=('dump1090' 'fatsv-data-source' 'faup1090')
backup=(etc/${_pkgbase})
install=(${_pkgbase}.install)
source=(${pkgname}::git://github.com/mutability/dump1090
	${_pkgbase}
	${_pkgbase}.service)
sha1sums=('SKIP'
          '578a300700e746ba3e5f8403764fb14a9b1f88d5'
          'aa4c8b844e7008794094947cea02530791dddfb1')
optdepends=('lighttpd: web display support')
changelog=('dump1090-mutability.changelog')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make all faup1090 "EXTRACFLAGS=-DHTMLPATH=\\\"/usr/share/dump1090-mutability/html\\\" -DMODES_DUMP1090_VARIANT=\\\"dump1090-mutability\\\""
}

package() {
  install -Dm644 -t "${pkgdir}/etc" ${_pkgbase}
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${_pkgbase}.service

  cd "${pkgname}"
  install -Dm755 dump1090 "${pkgdir}/usr/bin/dump1090-mutability"
  install -Dm755 view1090 "${pkgdir}/usr/bin/view1090-mutability"
  install -Dm755 faup1090 "${pkgdir}/usr/lib/piaware/helpers/faup1090"

  install -Dm644 -t "${pkgdir}/usr/share/${_pkgbase}/html/" ./public_html/*.{js,html,gif,css}
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgbase}/html/coolclock/" ./public_html/coolclock/*.js
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgbase}/html/flags-tiny" ./public_html/flags-tiny/*.{png,txt}
  install -Dm644 ./debian/lighttpd/89-dump1090.conf "${pkgdir}/usr/share/${_pkgbase}/dump1090-lighttpd.conf"

  install -Dm644 ./debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

