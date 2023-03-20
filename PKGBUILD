pkgname=hostapd-wifi6
pkgdesc="hostapd enabled IEEE802.11* in defconfig"
pkgver=2.10
pkgrel=3
arch=('x86_64')
url=https://w1.fi/hostapd
license=('BSD')
depends=('glibc' 'libnl' 'openssl' 'sqlite')
conflicts=('hostapd')
provides=('hostapd')
source=(
  "https://w1.fi/releases/hostapd-$pkgver.tar.gz"
  'hostapd.service'
)
sha512sums=(
  '243baa82d621f859d2507d8d5beb0ebda15a75548a62451dc9bca42717dcc8607adac49b354919a41d8257d16d07ac7268203a79750db0cfb34b51f80ff1ce8f'
  '34e16c5d46383477bcb9e0dba5073b7f01354a6adca8e591050aeff6319255f8939926b70d76d109735496bbaf9ff2d04be9cf6e0d057c4d2f4a4140067957a3'
)
prepare() {
  cd "hostapd-${pkgver}"
  sed -e 's|/etc/hostapd|/etc/hostapd/hostapd|g' \
      -e 's|/var/run|/run|g' \
      -e 's|radius_attr.sqlite|/var/lib/hostapd/radius_attr.sqlite|g' \
      -e 's|hostapd.cred|/var/lib/hostapd/hostapd.cred|g' \
      -e 's|hostapd.ap_settings|/var/lib/hostapd/hostapd.ap_settings|g' \
      -e 's|hostapd_wps_pin_requests|hostapd/wps_pin_requests|g' \
      -i 'hostapd/hostapd.conf'
  cat "hostapd/README" | head -n47 | tail -n5 > LICENSE
  cp 'hostapd/defconfig' "hostapd/.config"
  sed -e 's|^#CONFIG_IEEE80211AX=y|CONFIG_IEEE80211AX=y|g' \
      -e 's|^#CONFIG_ACS=y|CONFIG_ACS=y|g' \
      -i "hostapd/.config"
}
build(){
  make -C "hostapd-${pkgver}/hostapd"
}
package() {
  cd "hostapd-${pkgver}"
  make -C 'hostapd' install DESTDIR="${pkgdir}" BINDIR="/usr/bin"
  install -vDm 644 "../hostapd.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 640 "hostapd/hostapd."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/etc/hostapd"
  install -vDm 644 "hostapd/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "hostapd/"{README*,ChangeLog} -t "${pkgdir}/usr/share/doc/hostapd"
  install -vDm 644 "hostapd/hostapd.8" -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 "hostapd/hostapd_cli.1" -t "$pkgdir/usr/share/man/man1/"
  install -vdm 750 "${pkgdir}/var/lib/hostapd"
}
