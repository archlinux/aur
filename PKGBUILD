# Maintainer: Matthias Fulz mfulz [at] olznet [dot] de
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=hostapd-noscan-dynamic-vlan
_pkgname="hostapd"
pkgver=2.9
pkgrel=5
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator (with \"noscan\" patch)"
arch=('x86_64')
url="https://w1.fi/hostapd/"
license=('BSD')
depends=('glibc' 'libnl' 'openssl' 'sqlite')
conflicts=('hostapd')
provides=('hostapd')
backup=("etc/${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
source=("https://w1.fi/releases/$_pkgname-$pkgver.tar.gz"
        "https://w1.fi/security/2020-1/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch"
        "https://w1.fi/security/2020-1/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch"
        "https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch"
        "hostapd-2.9-CVE-2021-30004.patch::https://w1.fi/cgit/hostap/patch/?id=a0541334a6394f8237a4393b7372693cd7e96f15"
        config
        hostapd.service
        "hostapd-noscan.patch")
sha256sums=('881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7'
            '2d9a5b9d616f1b4aa4a22b967cee866e2f69b798b0b46803a7928c8559842bd7'
            '49feb35a5276279b465f6836d6fa2c6b34d94dc979e8b840d1918865c04260de'
            'a8212a2d89a5bab2824d22b6047e7740553df163114fcec94832bfa9c5c5d78a'
            'a726eec646a4c6bbff380fbc4a4797d9b2d0f1e45fb79411bbc26859e3213557'
            '202be493d55ecf3ac880b7044b0d03bd78ae76735e17be1cb3aba99abdc1c5f1'
            '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e'
            'f2a57f118d5884bdc5eaba3828545742775e763eade4837668f8cd3dec8bb812')

prepare() {
  cd "$_pkgname-$pkgver"
  for _patch_file in ../*.patch; do
    echo "Apply patch: ${_patch_file}"
    patch -Np1 -i "${_patch_file}"
  done

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
