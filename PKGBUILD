# Maintainer: Arpan Kapoor <a at arpankapoor dot com>

_pkgname=hostapd
pkgname="${_pkgname}-rtl871xdrv"
pkgver=2.9
pkgrel=1
pkgdesc='IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://w1.fi/hostapd/'
license=('GPL')
depends=('openssl' 'libnl')
makedepends=('git')
provides=("${_pkgname}")
options=(emptydirs)
source=(https://w1.fi/releases/"${_pkgname}-${pkgver}".tar.gz
        git+https://github.com/pritambaral/hostapd-rtl871xdrv.git
        config
        hostapd.service
        hostapd-noscan.patch
        openvswitch.patch)
sha256sums=('881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7'
            'SKIP'
            'SKIP'
            '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e'
            '5ad1aadcd7682e517cab6afb474df6b9abad1a08dbe2bb40571a1b91c33f6f09'
            '64c06b5f6f58923446fd9351c596c759dec130997677f8b9f013c8ce360fbd98')

prepare() {
  cd "${_pkgname}-${pkgver}"
  local i; for i in "${source[@]}"; do
    case $i in
      *.patch)
        msg2 "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
        ;;
    esac
  done

  # Realtek patch
  patch -Np1 -i "${srcdir}/hostapd-rtl871xdrv/rtlxdrv.patch"

  # Enable the driver
  echo 'CONFIG_DRIVER_RTW=y' >> "${srcdir}/config"
}

build() {
  cd "${_pkgname}-${pkgver}/hostapd"
  cp ../../config .config
  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "${pkgdir}/usr/lib/systemd/system/hostapd.service"

  cd "${_pkgname}-${pkgver}"

  # License
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"

  cd hostapd

  # Binaries
  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" hostapd hostapd_cli

  # Configuration
  install -d "${pkgdir}/etc/hostapd"
  install -d "${pkgdir}/usr/share/doc/hostapd"
  install -m644 -t "${pkgdir}/usr/share/doc/hostapd" \
    hostapd.{accept,conf,deny,eap_user,radius_clients,sim_db,vlan,wpa_psk} \
    wired.conf hlr_auc_gw.milenage_db

  # Man pages
  install -Dm644 hostapd.8 "${pkgdir}/usr/share/man/man8/hostapd.8"
  install -Dm644 hostapd_cli.1 "${pkgdir}/usr/share/man/man1/hostapd_cli.1"
}
