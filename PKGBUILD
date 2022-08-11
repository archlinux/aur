# Maintainer: Eric Woudstra <ericwouds@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgname=hostapd
pkgname=${_pkgname}-wnm-git
pkgver=hostap_2_10.r520.gb704dc72e
pkgrel=1
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator, extra WNM support"
arch=(x86_64 aarch64)
url="https://w1.fi/hostapd/"
license=(BSD)
depends=(glibc libnl openssl sqlite)
backup=("etc/${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
conflicts=( ${_pkgname} )
provides=( ${_pkgname} )
source=(
  'git://w1.fi/hostap.git'
  config
  hostapd.service
)
sha512sums=('SKIP'
            'bf9ef2e26ac4b4c434372965a304b1ac0c908e950bb8f13e4d052147013a6adbb4786e457ddd3e8e2f3a30a9a5e4e4a049c07b4487ab80d438f53925e9a11d35'
            '34e16c5d46383477bcb9e0dba5073b7f01354a6adca8e591050aeff6319255f8939926b70d76d109735496bbaf9ff2d04be9cf6e0d057c4d2f4a4140067957a3')

pkgver() {
  cd "hostap"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
echo $PWD
  cd "hostap"
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
  ln -sfv "${srcdir}/config" "${_pkgname}/.config"
}

build() {
  make -C "hostap/${_pkgname}"
}

package() {
  cd "hostap"
  make -C "${_pkgname}" install DESTDIR="${pkgdir}" BINDIR="/usr/bin"
  # systemd service
  install -vDm 644 "../${_pkgname}.service" -t "$pkgdir/usr/lib/systemd/system/"
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
