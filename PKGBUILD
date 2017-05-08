# Maintainer: David Thurstenson <thurstylark@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname='bluez-utils-compat'
_pkgbase='bluez'
pkgver=5.45
pkgrel=1
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="Development and debugging utilities for the bluetooth protocol stack. Includes deprecated tools."
depends=('dbus' 'systemd' 'glib2')
conflicts=('bluez-hcidump' 'bluez-utils')
provides=('bluez-hcidump' 'bluez-utils')
replaces=('bluez-hcidump' 'bluez<=4.101')
makedepends=('dbus' 'libical' 'systemd')
source=(https://www.kernel.org/pub/linux/bluetooth/${_pkgbase}-${pkgver}.tar.{xz,sign})
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9'
            'SKIP')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

build() {
  cd ${_pkgbase}-${pkgver}
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --enable-sixaxis \
          --enable-experimental \
          --enable-library \
          --enable-deprecated # to enable deprectated tools
  make
}

check() {
  cd ${_pkgbase}-${pkgver}
  make check
}

package() {

  cd ${_pkgbase}-${pkgver}
  make DESTDIR=${pkgdir} \
       install-binPROGRAMS \
       install-man1

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename=$(basename $files)
    install -Dm755 ${srcdir}/${_pkgbase}-${pkgver}/tools/$filename ${pkgdir}/usr/bin/$filename
  done

  # add gatttool usefulbdaddr with Bluetooth 4.0LE 
  install -Dm755 ${srcdir}/${_pkgbase}-${pkgver}/attrib/gatttool ${pkgdir}/usr/bin/gatttool
  
  # libbluetooth.so* are part of libLTLIBRARIES and binPROGRAMS targets
  #make DESTDIR=${pkgdir} uninstall-libLTLIBRARIES
  #rmdir ${pkgdir}/usr/lib
  rm -rf ${pkgdir}/usr/lib
  
  # move the hid2hci man page out
  mv ${pkgdir}/usr/share/man/man1/hid2hci.1 ${srcdir}/
}

