pkgname=hostapd-wifi6
pkgdesc='hostapd than enabled AC/AX and ACS support and applied intel lar patch, provide useful service unit hostapd@.service and hostapd-ACS@.service'
pkgver=2.10
pkgrel=10
arch=('x86_64' 'aarch64')
url=https://w1.fi/hostapd
license=('BSD')
depends=('glibc' 'libnl' 'openssl' 'sqlite'
  'lshw' 'jq' # for hostapd-preferred.sh
)
conflicts=('hostapd')
provides=('hostapd')
backup=(
  'etc/hostapd/hostapd.'{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk}
  'etc/hostapd/hostapd_'{2.4Ghz,5Ghz}'.conf'
  'etc/hostapd/preferred_config'
)
source=(
  "https://w1.fi/releases/hostapd-$pkgver.tar.gz"
  'https://tildearrow.org/storage/hostapd-2.10-lar.patch'
  'hostapd_2.4Ghz.conf'
  'hostapd_5Ghz.conf'
  'hostapd-ACS@.service'
  'hostapd-preferred.service'
  'hostapd-preferred.sh'
  'hostapd@.service'
  'preferred_config'
)
sha512sums=(
  '243baa82d621f859d2507d8d5beb0ebda15a75548a62451dc9bca42717dcc8607adac49b354919a41d8257d16d07ac7268203a79750db0cfb34b51f80ff1ce8f'
  '443e5c012b6e2d06ab812b87e995ca7e48751d43b81b3a26a722400f64ccdec0e9486a5e043121f2f1084cc59729f781b6e9d5c05031dac18cdeaaa86ed8ecea'
  'c1b9688b8e7f6ab984a5b528061aa2221773a5e3d24f4a43c84a28c318212eadd823c30a4a0e8316760ba2622329fc7edf89d1af744999db5c17e1d157d716a0'
  '21d890ea4f29728bfce4b7dcd9a456be54ea4db863b7c0cd861fd4fc46a93a12fc91329e6200b9156a1e97250da7bad21f33469e4984b1bf02faa794f584edab'
  '3132c58b9eccead25cc399a9761c03863a8a601e71a4e3cec495422c5f09afcbb8c922a4ec98ac0dbccf2633af6f6e41abd4e94cb2723118faa5046f12a3e375'
  'd958a3bbbd7b45861f3077908a61994361bcd72f30019d4b7f8f90561ae64b05154a4d30965396e2c0f69a4f6df6b25eb9b3d7a8b95ab3b8ac8b552fc7c09b80'
  'f39d06516c27de58cc9c3ca98f7b367ec41b8fddd9c568876c93c5f505445980495aaf13b0ea07460fc55e0093ff61014a9b48548b264067515a341b8e82e3ac'
  'cbc9c01bc264142a270af3d1cbacc53a01211cb14cb38d9a5907c3e18049dbfdad0b3048724c97fce3f2c4faf49754cc693467d19aec7c5220c959b0d13a424e'
  '6b3c3abff34a26081ec9cf8ebf1e69b99f8bb13b94b70797e764a912e294f1c8e9df6600eef629a6fe4f3f1a8b1eb1feefeb7eaa96105d4372f26a32a06bef99'
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
      -i 'hostapd/.config'
  echo 'CONFIG_SAE=y
CONFIG_SAE_PK=y' >> 'hostapd/.config'
  patch -p1 < "$srcdir/hostapd-2.10-lar.patch"
}
build(){
  make -C "hostapd-${pkgver}/hostapd"
}
package() {
  cd "hostapd-${pkgver}"
  make -C 'hostapd' install DESTDIR="${pkgdir}" BINDIR="/usr/bin"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 640 "hostapd/hostapd."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/etc/hostapd"
  install -vDm 644 "hostapd/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "hostapd/"{README*,ChangeLog} -t "${pkgdir}/usr/share/doc/hostapd"
  install -vDm 644 "hostapd/hostapd.8" -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 "hostapd/hostapd_cli.1" -t "$pkgdir/usr/share/man/man1/"
  install -vdm 750 "${pkgdir}/var/lib/hostapd"

  install -vDm 644 "../hostapd"{@,-ACS@,-preferred}".service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 750 "../hostapd-preferred.sh" -t "$pkgdir/usr/bin/hostapd-preferred.sh"
  install -vDm 600 "../hostapd_"{2.4Ghz,5Ghz}".conf" -t "${pkgdir}/etc/hostapd"
  install -vDm 640 "../preferred_config" -t "${pkgdir}/etc/hostapd"
}
