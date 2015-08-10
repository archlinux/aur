
# Maintainer: Sebastian Zwierzchowski

pkgname=hostapd-rtl
pkgver=2.4
pkgrel=2
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator"
arch=('i686' 'x86_64' 'armv7h' 'armv6l')
url="http://w1.fi/hostapd/"
license=('custom')
depends=('openssl' 'libnl')
install=hostapd.install
options=(emptydirs)
backup=('etc/hostapd/hostapd-rtl.conf')
source=(git://github.com/seba-z/hostapd-rtl.git
	hostapd.service
	hostapd-2.3-noscan.patch
	openvswitch.patch)
md5sums=('SKIP'
         '7fac28e598e16523777b528b93eab376'
         'eaf8e48a9a63b5902fddadff2b8933fa'
         'a0802a604ed957078da0e14863df74f0')

prepare() {
  cd $pkgname
  patch -p1 -i ../hostapd-2.3-noscan.patch
  patch -p1 -i ../openvswitch.patch
}

build() {
  cd $pkgname/hostapd
  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "$pkgdir/usr/lib/systemd/system/hostapd-rtl.service"

  cd $pkgname

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd hostapd

  # Binaries
  install -D hostapd "$pkgdir/usr/bin/hostapd-rtl"
  install  hostapd_cli "$pkgdir/usr/bin/hostapd_cli-rtl"

  # Configuration
  install -d "$pkgdir/etc/hostapd"
  install -m644 hostapd.conf "$pkgdir/etc/hostapd/${pkgname}.conf"
  install -d "$pkgdir/usr/share/doc/hostapd-rtl"
  install -m644 -t "$pkgdir/usr/share/doc/hostapd-rtl" \
    hostapd.{accept,conf,deny,eap_user,radius_clients,sim_db,vlan,wpa_psk} \
    wired.conf hlr_auc_gw.milenage_db

  # Man pages
  install -Dm644 hostapd.8 "$pkgdir/usr/share/man/man8/hostapd-rlt.8"
  install -Dm644 hostapd_cli.1 "$pkgdir/usr/share/man/man1/hostapd_cli-rtl.1"
}
