# Maintainer: Dan Schaper <dschaper at ganymeade dot com>

pkgname=dump1090-mutability-git
_pkgbase=dump1090-mutability
pkgver=1.14.r64.gb4490c7
pkgrel=1
pkgdesc="ADS-B / Mode S Ground Station System for simple RTL-SDR decoding/translating. Mutability Fork"
arch=('armv6h' 'armv7h')
url="https://github.com/mutability/dump1090"
license=('GPL' 'BSD')
depends=('rtl-sdr')
makedepends=('git')
provides=('dump1090' 'fatsv-data-source')
conflicts=()
backup=('etc/dump1090-mutability')
install=dump1090-mutability.install
source=(${pkgname}::git://github.com/mutability/dump1090
	${_pkgbase}
	${_pkgbase}.service)
sha1sums=('SKIP'
          '578a300700e746ba3e5f8403764fb14a9b1f88d5'
          '6485cf596a6cf9b1a274e0f2ca94edda9c86e47d')
optdepends=('lighttpd: web display support')
changelog=('dump1090-mutability.changelog')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make all faup1090 PREFIX=/usr
}

package() {
  install -d "${pkgdir}/etc"
  install -Dm644 ${_pkgbase} "${pkgdir}/etc"

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 ${_pkgbase}.service "${pkgdir}/usr/lib/systemd/system"

  cd "${pkgname}"
  install -Dm755 dump1090 "${pkgdir}/usr/bin/dump1090-mutability"
  install -Dm755 view1090 "${pkgdir}/usr/bin/view1090-mutability"
  install -Dm755 faup1090 "${pkgdir}/usr/bin/faup1090"

  install -d "${pkgdir}/usr/share/${_pkgbase}/html/"
  install -Dm644 ./public_html/*.* "${pkgdir}/usr/share/${_pkgbase}/html/"
  install -d "${pkgdir}/usr/share/${_pkgbase}/html/coolclock/"
  install -Dm644 ./public_html/coolclock/*.* "${pkgdir}/usr/share/${_pkgbase}/html/coolclock/"
  install -Dm644 ./debian/lighttpd/89-dump1090.conf "${pkgdir}/usr/share/${_pkgbase}/dump1090-lighttpd.conf"

  install -Dm644 ./debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

