# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=hostapd-noscan
_pkgname="hostapd"
pkgver=2.9
pkgrel=2
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator (with \"noscan\" patch)"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://w1.fi/hostapd/"
license=('BSD')
depends=('glibc' 'libnl' 'openssl' 'sqlite')
conflicts=('hostapd')
provides=('hostapd')
backup=("etc/${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
source=("https://w1.fi/releases/$_pkgname-$pkgver.tar.gz"
        "config"
        "hostapd.service"
        "hostapd-noscan.patch")
sha256sums=('881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7'
            '87445203a518864e704b85fa970d90940e9a5d9b401ceb802d11caab6c07a495'
            '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e'
            'f2a57f118d5884bdc5eaba3828545742775e763eade4837668f8cd3dec8bb812')

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

  # apply "noscan" patch
  msg2 "Applying \"noscan\" patch"
  patch -p1 -i "$srcdir/hostapd-noscan.patch"
}

build() {
  cd $_pkgname-$pkgver/hostapd
  make
}

package() {
  cd "$_pkgname-$pkgver"

  make -C "${_pkgname}" install DESTDIR="${pkgdir}" BINDIR="/usr/bin"

  # systemd service
  install -vDm 644 "../${_pkgname}.service" \
    -t "$pkgdir/usr/lib/systemd/system/"

  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"

  # config
  install -d "$pkgdir/etc/hostapd"
  install -vDm 640 "${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} \
    -t "${pkgdir}/etc/${_pkgname}"

  # docs
  install -vDm 644 "${_pkgname}/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} \
    "${_pkgname}/"{README*,ChangeLog} \
    -t "${pkgdir}/usr/share/doc/${_pkgname}"

  # man pages
  install -vDm 644 "${_pkgname}/${_pkgname}.8" -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 "${_pkgname}/${_pkgname}_cli.1" \
    -t "$pkgdir/usr/share/man/man1/"

  # state dir
  install -vdm 750 "${pkgdir}/var/lib/${_pkgname}"
}
