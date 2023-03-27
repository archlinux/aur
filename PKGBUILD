pkgname=hostapd-wifi6
pkgdesc='the hostapd be enabled AC/AX and ACS support and applied intel lar patch
and provide useful service unit hostapd@.service and hostapd-ACS@.service'
pkgver=2.10
pkgrel=5
arch=('x86_64')
url=https://w1.fi/hostapd
license=('BSD')
depends=('glibc' 'libnl' 'openssl' 'sqlite')
conflicts=('hostapd')
provides=('hostapd')
source=(
  "https://w1.fi/releases/hostapd-$pkgver.tar.gz"
  'hostapd@.service'
  'hostapd-ACS@.service'
  'https://tildearrow.org/storage/hostapd-2.10-lar.patch'
)
sha512sums=(
  '243baa82d621f859d2507d8d5beb0ebda15a75548a62451dc9bca42717dcc8607adac49b354919a41d8257d16d07ac7268203a79750db0cfb34b51f80ff1ce8f'
  'cbc9c01bc264142a270af3d1cbacc53a01211cb14cb38d9a5907c3e18049dbfdad0b3048724c97fce3f2c4faf49754cc693467d19aec7c5220c959b0d13a424e'
  '3132c58b9eccead25cc399a9761c03863a8a601e71a4e3cec495422c5f09afcbb8c922a4ec98ac0dbccf2633af6f6e41abd4e94cb2723118faa5046f12a3e375'
  '443e5c012b6e2d06ab812b87e995ca7e48751d43b81b3a26a722400f64ccdec0e9486a5e043121f2f1084cc59729f781b6e9d5c05031dac18cdeaaa86ed8ecea'
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
      -e 's|^#CONFIG_IEEE80211AC=y|CONFIG_IEEE80211AC=y|g' \
      -e 's|^#CONFIG_ACS=y|CONFIG_ACS=y|g' \
      -i "hostapd/.config"
  patch -p1 < "$srcdir/hostapd-2.10-lar.patch"
}
build(){
  make -C "hostapd-${pkgver}/hostapd"
}
package() {
  cd "hostapd-${pkgver}"
  make -C 'hostapd' install DESTDIR="${pkgdir}" BINDIR="/usr/bin"
  install -vDm 644 "../hostapd@.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 "../hostapd-ACS@.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 640 "hostapd/hostapd."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/etc/hostapd"
  install -vDm 644 "hostapd/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "hostapd/"{README*,ChangeLog} -t "${pkgdir}/usr/share/doc/hostapd"
  install -vDm 644 "hostapd/hostapd.8" -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 "hostapd/hostapd_cli.1" -t "$pkgdir/usr/share/man/man1/"
  install -vdm 750 "${pkgdir}/var/lib/hostapd"
}
