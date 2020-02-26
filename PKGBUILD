# Maintainer: fryfrog@gmail.com

pkgname=readsb-git
_gitname=readsb
pkgver=3.8.1.r8.gf98e3a1
pkgrel=1
pkgdesc="Readsb is a Mode-S/ADSB/TIS decoder for RTLSDR, BladeRF, Modes-Beast and GNS5894 devices."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Mictronics/readsb"
license=('BSD')
depends=('bladerf' 'libiio' 'libad9361' 'rtl-sdr')
makedepends=('git')
source=('readsb::git+git://github.com/Mictronics/readsb'
	'readsb.service')

sha256sums=('SKIP'
            '105ec41d815ce6b7b33e7c8d309e8fc19b65847663be86774944bf7c18f912db')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags --match=v* | sed 's/dev.//g' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make BLADERF=yes RTLSDR=yes PLUTOSDR=yes
}

package() {
  # mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/${_gitname}/readsb" "${pkgdir}/usr/bin/readsb"
  install -D -m755 "${srcdir}/${_gitname}/viewadsb" "${pkgdir}/usr/bin/viewadsb"
  #install -d -m755 "${pkgdir}/usr/share/readsb/html"
  install -D -m644 readsb.service "${pkgdir}/usr/lib/systemd/system/readsb.service"
  #cp -r "${srcdir}"/"${_gitname}"/public_html/* "${pkgdir}/usr/share/readsb/html"
  #install -D -m644 "${srcdir}"/lighttpd.conf "${pkgdir}/usr/share/readsb/lighttpd.conf"
}
