# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=readsb
pkgver=4.0.1
pkgrel=2
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
          'dump1090'
          'dump1090-fa')
backup=('etc/default/readsb')

source=("readsb-protobuf-${pkgver}.tar.gz::https://github.com/Mictronics/readsb-protobuf/archive/v${pkgver}.tar.gz"
	'readsb-protobuf-4.0.1.patch'
        'readsb.default'
        'readsb.sysusers'
	'readsb.service'
	'readsb.tmpfiles')

sha256sums=('c4eba1d77af0bdcb5d129c106353c7ab5a696792d4a7b9fbda9aa62dfab66973'
            '4b0293f3f13080a168d127e7c7c84b48e9a146e765f46e32cd3e69fea82ba447'
            '1b6721ee262fdc04f9009a793eca96b81127145b4314e21b3ad468c504c1c9d6'
            '3da99128f5a89aef6f9748f1e09f0120940f123e80c007e7d5ac2d0571740a05'
            'd65a8e71d54ab411735c71704145101b78eb2dd7cd8c6bd1f957af70fd94667d'
            '39ed9d33054f7e7bb7f97b7ef27bd17f12f8fd01e4f341328ab735474464592b')

prepare() {
  cd "${srcdir}/readsb-protobuf-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/readsb-protobuf-${pkgver}.patch"
}

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
