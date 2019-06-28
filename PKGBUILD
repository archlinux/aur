# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: David Thurstenson <thurstylark@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname='bluez-utils-compat'
_pkgbase='bluez'
pkgver=5.50
pkgrel=6
url="http://www.bluez.org/"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
license=('GPL2')
pkgdesc="Development and debugging utilities for the bluetooth protocol stack. Includes deprecated tools."
depends=('dbus' 'systemd' 'glib2')
makedepends=('libical' 'alsa-lib' 'ell')
optdepends=('ell: for btpclient')
conflicts=('bluez-hcidump' 'bluez-utils' 'bluez-hcitool')
provides=('bluez-hcidump' 'bluez-utils' 'bluez-hcitool')
replaces=('bluez-hcidump' 'bluez<=4.101')
source=("https://www.kernel.org/pub/linux/bluetooth/${_pkgbase}-${pkgver}.tar."{xz,sign}
        'refresh_adv_manager_for_non-LE_devices.diff::https://git.archlinux.org/svntogit/packages.git/plain/trunk/refresh_adv_manager_for_non-LE_devices.diff?h=packages/bluez')
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911'
            'SKIP'
            'ae195834cdc9d3d1961ae3c49da6381c820883a5af580e61aebed05a3e911d48')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  cd "${_pkgbase}-${pkgver}"
  patch -Np1 -i ../refresh_adv_manager_for_non-LE_devices.diff
}

build() {
  cd "${_pkgbase}-${pkgver}"
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --with-dbusconfdir=/usr/share \
          --enable-btpclient \
          --enable-midi \
          --enable-sixaxis \
          --enable-mesh \
          --enable-experimental \
          --enable-library \
          --enable-deprecated # to enable deprectated tools
  make
}

check() {
  cd "${_pkgbase}-${pkgver}"
  make check
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" \
       install-binPROGRAMS \
       install-man1

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename="$(basename "$files")"
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}"/tools/$filename "${pkgdir}"/usr/bin/$filename
  done

  # add gatttool usefulbdaddr with Bluetooth 4.0LE 
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}"/attrib/gatttool "${pkgdir}"/usr/bin/gatttool
  
  # libbluetooth.so* are part of libLTLIBRARIES and binPROGRAMS targets
  #make DESTDIR=${pkgdir} uninstall-libLTLIBRARIES
  #rmdir ${pkgdir}/usr/lib
  rm -rf "${pkgdir}"/usr/lib
  
  # move the hid2hci man page out
  mv "${pkgdir}"/usr/share/man/man1/hid2hci.1 "${srcdir}"/
}
