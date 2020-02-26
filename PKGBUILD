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
        'readsb.sysusers'
	'readsb.service')

sha256sums=('SKIP'
            '890a39ad0a51c05e3ce328109f713dcaf133991552a8c4e597a8f05b3b9d2ba4'
            '3da99128f5a89aef6f9748f1e09f0120940f123e80c007e7d5ac2d0571740a05'
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
  install -D -m 644 readsb.sysusers "${pkgdir}/usr/lib/sysusers.d/readsb.conf"
  install -D -m 644 readsb.service "${pkgdir}/usr/lib/systemd/system/readsb.service"
}
