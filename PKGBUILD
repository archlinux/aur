# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=readsb
pkgver=4.0.0
pkgrel=1
pkgdesc="A Mode-S/ADSB/TIS decoder for RTLSDR, BladeRF, Modes-Beast and GNS5894 devices."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Mictronics/readsb-protobuf"
license=('GPL3')
depends=(
  'bladerf'
  'libiio'
  'libad9361'
  'rtl-sdr'
  'protobuf-c'
  'ncurses'
  'rrdtool'
)
provides=('readsb'
          'dump1090-fa')
backup=('etc/default/readsb')

source=("readsb-v${pkgver}.tar.gz::https://github.com/Mictronics/readsb-protobuf/archive/v${pkgver}.tar.gz"
        'readsb.default'
        'readsb.sysusers'
	'readsb.service'
	'readsb.tmpfiles')

sha256sums=('89c7d28a56f2cf56a619c381463f4073a1ddb22309e67642531aaf7f603f4baa'
            '1b6721ee262fdc04f9009a793eca96b81127145b4314e21b3ad468c504c1c9d6'
            '3da99128f5a89aef6f9748f1e09f0120940f123e80c007e7d5ac2d0571740a05'
            'da7b799553bf6098573a9a03fce4baaf1ef20f668a7a4772d4c1bd62aaf08736'
            '39ed9d33054f7e7bb7f97b7ef27bd17f12f8fd01e4f341328ab735474464592b')

build() {
  cd "${srcdir}/readsb-protobuf-${pkgver}"
  make -j1 BLADERF=yes RTLSDR=yes PLUTOSDR=yes
}

package() {
  install -D -m 755 "${srcdir}/readsb-protobuf-${pkgver}/readsb" "${pkgdir}/usr/bin/readsb"
  install -D -m 755 "${srcdir}/readsb-protobuf-${pkgver}/viewadsb" "${pkgdir}/usr/bin/viewadsb"
  install -D -m 644 readsb.default "${pkgdir}/etc/default/readsb"
  install -D -m 644 readsb.sysusers "${pkgdir}/usr/lib/sysusers.d/readsb.conf"
  install -D -m 644 readsb.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/readsb.conf"
  install -D -m 644 readsb.service "${pkgdir}/usr/lib/systemd/system/readsb.service"
}
