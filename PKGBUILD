# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=hostapd-noscan
_pkgname=hostapd
pkgver=2.10
pkgrel=4
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator (with \"noscan\" patch)"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://w1.fi/hostapd/"
license=(BSD)
depends=(glibc libnl openssl sqlite)
conflicts=(hostapd)
provides=(hostapd)
backup=("etc/${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
source=("https://w1.fi/releases/${_pkgname}-${pkgver}.tar.gz"
        "config"
        "hostapd.service"
        "hostapd@.service"
        "noscan.patch")
sha256sums=('206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4c9466f1498915d'
            '60f2d0dd943f78a90662f894ec0a97a0fc95cfbac1c2628da64f1da83e344f0b'
            '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e'
            '80d82f6515df1061d2fad4a39a1efb9c4ef9828837441d556593a3f852242a95'
            'b449b6158466903c06c0ed0f19aef506351021f8b332eabc03467e9928258128')

prepare() {
  cd "${_pkgname}-${pkgver}"

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
  patch -Np0 -i "${srcdir}/noscan.patch"
}

build() {
  make -C "${_pkgname}-${pkgver}/${_pkgname}"
}

package() {
  cd "${_pkgname}-${pkgver}"

  make -C "${_pkgname}" install DESTDIR="${pkgdir}" BINDIR="/usr/bin"

  # systemd service
  install -vDm 644 "../${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -vDm 644 "../${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system/"

  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

  # config
  install -vDm 640 "${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/etc/${_pkgname}"

  # docs
  install -vDm 644 "${_pkgname}/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "${_pkgname}/"{README*,ChangeLog} -t "${pkgdir}/usr/share/doc/${_pkgname}"

  # man pages
  install -vDm 644 "${_pkgname}/${_pkgname}.8" -t "${pkgdir}/usr/share/man/man8/"
  install -vDm 644 "${_pkgname}/${_pkgname}_cli.1" -t "${pkgdir}/usr/share/man/man1/"

  # state dir
  install -vdm 750 "${pkgdir}/var/lib/${_pkgname}"
}
