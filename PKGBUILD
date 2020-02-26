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
backup=('etc/default/readsb')

source=('readsb::git+git://github.com/Mictronics/readsb'
        'readsb.default'
	'readsb.service')

sha256sums=('SKIP'
            '561069dcfb4fb370327430ddb509c18b598311426143b614261f5a05143e42ee'
            'a99005c2103187615af3d6acf79ffb6507848aef91bb936af5a0bc8a6ac696ea')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags --match=v* | sed 's/dev.//g' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make BLADERF=yes RTLSDR=yes PLUTOSDR=yes
}

package() {
  install -D -m 755 "${srcdir}/${_gitname}/readsb" "${pkgdir}/usr/bin/readsb"
  install -D -m 755 "${srcdir}/${_gitname}/viewadsb" "${pkgdir}/usr/bin/viewadsb"
  install -D -m 644 readsb.default "${pkgdir}/etc/default/readsb"
  install -D -m 644 readsb.service "${pkgdir}/usr/lib/systemd/system/readsb.service"
}
