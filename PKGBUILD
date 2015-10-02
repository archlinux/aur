# Maintainer: Arpan Kapoor

pkgname=hostapd-rtl871xdrv
pkgver=2.5
pkgrel=1
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://w1.fi/hostapd/"
license=('custom')
depends=('openssl' 'libnl')
makedepends=('git')
provides=('hostapd')
conflicts=('hostapd')
install=hostapd.install
options=(emptydirs)
source=(http://w1.fi/releases/hostapd-$pkgver.tar.gz
	git://github.com/arpankapoor/hostapd-rtl871xdrv.git
	hostapd.service
	hostapd-2.3-noscan.patch
	openvswitch.patch)
md5sums=('69f9cec3f76d74f402864a43e4f8624f'
         'SKIP'
         '380042b9cf4950e34ed34b3093ab9e7f'
         'eaf8e48a9a63b5902fddadff2b8933fa'
         'a0802a604ed957078da0e14863df74f0')

prepare() {
  cd hostapd-$pkgver
  patch -p1 -i $srcdir/hostapd-2.3-noscan.patch
  patch -p1 -i $srcdir/openvswitch.patch

  # Realtek patch
  patch -Np1 -i $srcdir/hostapd-rtl871xdrv/rtlxdrv.patch
  cp $srcdir/hostapd-rtl871xdrv/driver_* src/drivers/
  cp $srcdir/hostapd-rtl871xdrv/.config hostapd/.config
}

build() {
  cd hostapd-$pkgver/hostapd
  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "$pkgdir/usr/lib/systemd/system/hostapd.service"

  cd hostapd-$pkgver

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/hostapd/COPYING"

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
