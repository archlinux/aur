# Maintainer: Matthias Fulz mfulz [at] olznet [dot] de
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=hostapd-noscan-dynamic-vlan
_pkgname="hostapd"
pkgver=2.10
pkgrel=4
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator"
arch=(x86_64)
url="https://w1.fi/hostapd/"
license=(BSD)
depends=(glibc libnl openssl sqlite)
backup=("etc/${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
source=(
  "https://w1.fi/releases/$_pkgname-$pkgver.tar.gz"{,.asc}
  config
  hostapd.service
  hostapd@.service
)
sha512sums=('243baa82d621f859d2507d8d5beb0ebda15a75548a62451dc9bca42717dcc8607adac49b354919a41d8257d16d07ac7268203a79750db0cfb34b51f80ff1ce8f'
            'SKIP'
            '4e3d96bc1e6633528e14778fd9239e1bf611ef00cae5f26ecb2127103b7072e6502bd3047359231220f533918dea4bd917605adbf2033de020d385e8ae95cd28'
            '34e16c5d46383477bcb9e0dba5073b7f01354a6adca8e591050aeff6319255f8939926b70d76d109735496bbaf9ff2d04be9cf6e0d057c4d2f4a4140067957a3'
            '51f472ed969037bd4d480d13e356a03207316169ef0ac532c40d2e7a618d0fef0529eb060a7d146d28c31efef9b5942bc12661f29d970a6ea0d972f7d2b9d3dc')
b2sums=('dbeeae2f62a8ab52df3e2d05ff0467b643cd68349ef3b28814a11dfb67d4b23d14cf2461a3040694706ec614fcd7c2e0fe58f3597e877cf47296cd75e11c792f'
        'SKIP'
        'fc36d1406ef8200da7f76f59ad074833b59d2b5c491cd70687e804fd8b74df2ca4523cd26beed5619d74ec95e6bff944cba54e7f0441777dd60d86b15c587e7d'
        'dbb4d1ad4359931bd70d6ad428b509e0c40dab3a55ba7b87cf1c00a458d737c2a4ed6f06dd23286d9e4a38a481e4af9ab4ffa8e6fb27d852aa4eb7d16d046bf8'
        'a36556144a4e98b2be15fb2920ce18bc13377dc2fa4becb5f122f40aaaa7ece4e169fdaa39a60b96275fdc94ee08a31a21684c6ffd14a5417b9752c79215edb4')
validpgpkeys=('EC4AA0A991A5F2464582D52D2B6EF432EFC895FA') # Jouni Malinen

prepare() {
  cd "$_pkgname-$pkgver"
  # fix include locations in main configuration file
  sed -e 's|/etc/hostapd|/etc/hostapd/hostapd|g' \
      -e 's|/var/run|/run|g' \
      -e 's|radius_attr.sqlite|/var/lib/hostapd/radius_attr.sqlite|g' \
      -e 's|hostapd.cred|/var/lib/hostapd/hostapd.cred|g' \
      -e 's|hostapd.ap_settings|/var/lib/hostapd/hostapd.ap_settings|g' \
      -e 's|hostapd_wps_pin_requests|hostapd/wps_pin_requests|g' \
      -i "${_pkgname}/${_pkgname}.conf"

  # extract license
  cat "${_pkgname}/README" |head -n47 |tail -n5 > LICENSE

  # link build configuration into place:
  # an up-to-date version of the build configuration can be found in
  # hostapd/defconfig and should be diffed with the packaged one before every
  # build
  ln -sv "${srcdir}/config" "${_pkgname}/.config"
}

build() {
  make -C $_pkgname-$pkgver/$_pkgname
}

package() {
  cd "$_pkgname-$pkgver"
  make -C "${_pkgname}" install DESTDIR="${pkgdir}" BINDIR="/usr/bin"
  # systemd service
  install -vDm 644 "../${_pkgname}.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 "../${_pkgname}@.service" -t "$pkgdir/usr/lib/systemd/system/"
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  # config
  install -vDm 640 "${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/etc/${_pkgname}"
  # docs
  install -vDm 644 "${_pkgname}/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "${_pkgname}/"{README*,ChangeLog} -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # man pages
  install -vDm 644 "${_pkgname}/${_pkgname}.8" -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 "${_pkgname}/${_pkgname}_cli.1" -t "$pkgdir/usr/share/man/man1/"
  # state dir
  install -vdm 750 "${pkgdir}/var/lib/${_pkgname}"
}
