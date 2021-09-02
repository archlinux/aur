# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgbase=bluez-noudev
_pkgbase=bluez
pkgname=( {bluez,bluez-utils,bluez-libs,bluez-cups,bluez-plugins}'-noudev' )
pkgver=5.61
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
makedepends=('dbus' 'libical' 'udev' 'alsa-lib' 'json-c' 'ell' 'python-docutils')
source=("https://www.kernel.org/pub/linux/bluetooth/${_pkgbase}-${pkgver}.tar".{xz,sign}
        'https://gitea.artixlinux.org/packagesB/bluez/raw/commit/166e66178bfb669f9dd0d94ba0202208b441dff5/x86_64/extra/bluetooth.modprobe'
)
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b'
            'SKIP'
            '46c021be659c9a1c4e55afd04df0c059af1f3d98a96338236412e449bf7477b4')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

build() {
  cd "${_pkgbase}"-${pkgver}
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
          --enable-hid2hci \
          --enable-experimental \
	  --disable-systemd \
          --disable-udev \
          --enable-library # this is deprecated
  make
}

check() {
  cd "${_pkgbase}"-$pkgver
  # tests segfault and hang
#  make check || /bin/true # https://bugzilla.kernel.org/show_bug.cgi?id=196621
}


package_bluez-noudev() {
  pkgdesc="Daemons for the bluetooth protocol stack"
  depends=('libical' 'dbus' 'glib2' 'alsa-lib' 'json-c')
  backup=('etc/bluetooth/main.conf')
  provides=( 'bluez' )
  conflicts=('obexd-client' 'obexd-server' 'bluez')

  cd "${_pkgbase}"-${pkgver}
  make DESTDIR=${pkgdir} \
       install-pkglibexecPROGRAMS \
       install-dbussessionbusDATA \
       install-dbussystembusDATA \
       install-dbusDATA \
       install-man8

  # ship upstream main config file
  install -dm755 "${pkgdir}"/etc/bluetooth
  install -Dm644 "${srcdir}"/"${_pkgbase}"-${pkgver}/src/main.conf "${pkgdir}"/etc/bluetooth/main.conf

  # add basic documention
  install -dm755 "${pkgdir}"/usr/share/doc/"${_pkgbase}"/dbus-apis
  cp -a doc/*.txt "${pkgdir}"/usr/share/doc/"${_pkgbase}"/dbus-apis/
  # fix module loading errors
  install -dm755 "${pkgdir}"/usr/lib/modprobe.d
  install -Dm644 "${srcdir}"/bluetooth.modprobe "${pkgdir}"/usr/lib/modprobe.d/bluetooth-usb.conf
  # load module at system start required by some functions
  # https://bugzilla.kernel.org/show_bug.cgi?id=196621
  install -dm755 "$pkgdir"/usr/lib/modules-load.d
  echo "crypto_user" > "$pkgdir"/usr/lib/modules-load.d/bluez.conf

  # Artix (Don't remove) installs dbus service
  install -Dm644 /dev/stdin "$pkgdir"/usr/share/dbus-1/services/org.bluez.obex.service <<EOF
[D-BUS Service]
Name=org.bluez.obex
Exec=/usr/lib/bluetooth/obexd
EOF
}

package_bluez-utils-noudev() {
  pkgdesc="Development and debugging utilities for the bluetooth protocol stack"
  depends=('dbus' 'glib2')
  optdepends=('ell: for btpclient')
  conflicts=('bluez-hcidump' 'bluez-utils')
  provides=('bluez-hcidump' 'bluez-utils')
  replaces=('bluez-hcidump' 'bluez<=4.101')

  cd "${_pkgbase}"-${pkgver}
  make DESTDIR="${pkgdir}" \
       install-binPROGRAMS \
       install-dist_zshcompletionDATA \
       install-man1

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename=$(basename $files)
    install -Dm755 "${srcdir}"/"${_pkgbase}"-${pkgver}/tools/$filename "${pkgdir}"/usr/bin/$filename
  done
  
  # libbluetooth.so* are part of libLTLIBRARIES and binPROGRAMS targets
  #make DESTDIR=${pkgdir} uninstall-libLTLIBRARIES
  #rmdir ${pkgdir}/usr/lib
  rm -rf "${pkgdir}"/usr/lib
  
}

package_bluez-libs-noudev() {
  pkgdesc="Deprecated libraries for the bluetooth protocol stack"
  depends=('glibc')
  conflicts=( 'bluez-libs' )
  provides=('libbluetooth.so' 'bluez-libs')
  license=('LGPL2.1')

  cd "${_pkgbase}"-${pkgver}
  make DESTDIR="${pkgdir}" \
       install-pkgincludeHEADERS \
       install-libLTLIBRARIES \
       install-pkgconfigDATA
}

package_bluez-cups-noudev() {
  pkgdesc="CUPS printer backend for Bluetooth printers"
  conflicts=( 'bluez-cups' )
  provides=( 'bluez-cups' )
  depends=('cups')

  cd "${_pkgbase}"-${pkgver}
  make DESTDIR="${pkgdir}" install-cupsPROGRAMS
}

package_bluez-plugins-noudev() {
  pkgdesc="bluez plugins (PS3 Sixaxis controller)"
  conflicts=( 'bluez-plugins' )
  provides=( 'bluez-plugins' )
  cd "${_pkgbase}"-${pkgver}
  make DESTDIR="${pkgdir}" \
       install-pluginLTLIBRARIES
}
