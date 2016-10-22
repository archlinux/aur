# Maintainer: Arpan Kapoor <k dot arpan26 at gmail dot com>

pkgname=hostapd-rtl871xdrv
_pkgname=${pkgname%-*}
pkgver=2.6
pkgrel=1
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://w1.fi/hostapd/"
license=('custom')
depends=('openssl' 'libnl')
makedepends=('git')
provides=('hostapd')
conflicts=('hostapd')
install=${_pkgname}.install
options=(emptydirs)
source=(http://w1.fi/releases/${_pkgname}-${pkgver}.tar.gz
	git://github.com/pritambaral/hostapd-rtl871xdrv.git
	config
	hostapd.service
	hostapd-2.3-noscan.patch
	openvswitch.patch)
md5sums=('eaa56dce9bd8f1d195eb62596eab34c7'
         'SKIP'
         '43c0ec1d8b4d4e46f468bc161bb05c4b'
         '380042b9cf4950e34ed34b3093ab9e7f'
         'f40f2652f2cd22d4bf1cfd76e02b9225'
         'a0802a604ed957078da0e14863df74f0')

prepare() {
  cd ${_pkgname}-$pkgver
  patch -p1 -i $srcdir/hostapd-2.3-noscan.patch
  patch -p1 -i $srcdir/openvswitch.patch

  # Realtek patch
  patch -Np1 -i $srcdir/hostapd-rtl871xdrv/rtlxdrv.patch
}

build() {
  cd ${_pkgname}-$pkgver/hostapd
  cp ../../config .config

  # Enable the driver
  echo "CONFIG_DRIVER_RTW=y" >> .config

  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "$pkgdir/usr/lib/systemd/system/hostapd.service"

  cd ${_pkgname}-$pkgver

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${_pkgname}/COPYING"

  cd hostapd

  # Binaries
  install -d "$pkgdir/usr/bin"
  install -t "$pkgdir/usr/bin" hostapd hostapd_cli

  # Configuration
  install -d "$pkgdir/etc/hostapd"
  install -d "$pkgdir/usr/share/doc/hostapd"
  install -m644 -t "$pkgdir/usr/share/doc/hostapd" \
    hostapd.{accept,conf,deny,eap_user,radius_clients,sim_db,vlan,wpa_psk} \
    wired.conf hlr_auc_gw.milenage_db

  # Man pages
  install -Dm644 hostapd.8 "$pkgdir/usr/share/man/man8/hostapd.8"
  install -Dm644 hostapd_cli.1 "$pkgdir/usr/share/man/man1/hostapd_cli.1"
}
