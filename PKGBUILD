# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

_pkgname=hostapd
pkgname=${_pkgname}-noscan
pkgver=2.11
pkgrel=1
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator (with \"noscan\" patch)"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://w1.fi/hostapd/"
license=(BSD-3-Clause)
depends=(glibc libnl openssl sqlite)
makedepends=(patch)
conflicts=(hostapd)
provides=(hostapd)
backup=("etc/${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
source=("https://w1.fi/releases/${_pkgname}-${pkgver}.tar.gz"
        "config"
        "hostapd.service"
        "hostapd@.service"
        "hostapd.tmpfiles"
        "hostapd-2.11-fhs-config.patch"
        "noscan.patch")
sha256sums=('2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a'
            'a31e05fed8531192a790c7901df7c315d358e059f0738a46f524db4ee4f73d7f'
            '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e'
            '80d82f6515df1061d2fad4a39a1efb9c4ef9828837441d556593a3f852242a95'
            'a9bf75500d2b741828df8a70c52e836ebaf10757d35e035a24f43eeae4c9cd6b'
            'd9dc620e120afec57df2d1a689c4f71de47176f52f427c721bcb4c02977237ea'
            '0014264f58012d5616730fba96082266e6aabdba1815909eafb7b03dff854515')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # make include locations in main configuration file filesystem compliant
  patch -Np1 -i "${srcdir}/hostapd-2.11-fhs-config.patch"

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
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

  # config
  install -vDm 640 "${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/etc/${_pkgname}"
  install -vDm 640 "${_pkgname}/${_pkgname}."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "${pkgdir}/usr/share/factory/etc/${_pkgname}"

  # docs
  install -vDm 644 "${_pkgname}/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "${_pkgname}/"{README*,ChangeLog} -t "${pkgdir}/usr/share/doc/${_pkgname}"

  # man pages
  install -vDm 644 "${_pkgname}/${_pkgname}.8" -t "${pkgdir}/usr/share/man/man8/"
  install -vDm 644 "${_pkgname}/${_pkgname}_cli.1" -t "${pkgdir}/usr/share/man/man1/"

  # tmpfiles.d
  install -vDm 644 "../${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
