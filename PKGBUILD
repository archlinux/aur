# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: quequotion <quequotion at bugmenot dot com>
# Contributor: Tom Gundersen <teg at jklm dot no>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Geoffroy Carrier <geoffroy at archlinux dot org>

pkgbase=lib32-bluez
pkgname=(${pkgbase}{,-libs,-cups,-plugins})
pkgver=5.32
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
makedepends=('gcc-multilib' 'gcc-libs-multilib' 'lib32-dbus' 'lib32-libical' 'lib32-systemd')
source=("http://www.kernel.org/pub/linux/bluetooth/${pkgbase#lib32-}-${pkgver}.tar."{xz,sign}
        "0001-Allow-using-obexd-without-systemd-in-the-user-session.patch"
        "bluetooth.modprobe")
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha512sums=('718d0e1132123b67acaf0cf91aaf0add1e56b5b79fbb3cc4a72299c6ae00bfab6e0096463969b6bc27fdbeb18d4b62823d59356f6ff661b0bbe2df8205775f28'
            'SKIP'
            '26b69ec88fc597510b5b5b53570a8dba374c73628f8471bfd0cad83ee8960aba99e1790741787392eec8ab6ccb23c4a8227f7c6383aae49c5172dce046b5a26a'
            '5370ea87fc3f76ab46f2d549c5396b6204a21b629d4765de658fe8e90331b936a36aa8624de8bb2304cc1b78ac2fa6e84f2411f247dff1aab2daf7aa21b2c650')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  cd "${srcdir}/${pkgbase#lib32-}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  # patch not upstreamable for obex file transfer - FS#37773 taken from FC
  # http://www.hadess.net/2013/11/bluetooth-file-sharing-obexpush-in.html
  patch -Np1 -i "${srcdir}/0001-Allow-using-obexd-without-systemd-in-the-user-session.patch"
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${pkgbase#lib32-}-${pkgver}"
  ./configure \
              --prefix=/usr \
              --mandir=/usr/share/man \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libdir=/usr/lib32 \
              --libexecdir=/usr/lib32 \
              --enable-sixaxis \
              --enable-experimental \
              --enable-library # this is deprecated
  make
}

check() {
  cd "${srcdir}/${pkgbase#lib32-}-${pkgver}"
  #make check
}

package_lib32-bluez() {
  pkgdesc="Daemons for the bluetooth protocol stack (32-bit)"
  depends=(lib32-{libical,dbus,glib2} 'bluez')

  cd "${pkgbase#lib32-}-${pkgver}"
  make DESTDIR=${pkgdir} \
       install-libexecPROGRAMS \
       install-dbussessionbusDATA \
       install-systemdsystemunitDATA \
       install-systemduserunitDATA \
       install-dbussystembusDATA \
       install-dbusDATA \
       install-man8

  # ship upstream main config file
  install -dm755 ${pkgdir}/etc/bluetooth
  install -Dm644 ${srcdir}/${pkgbase#lib32-}-${pkgver}/src/main.conf ${pkgdir}/etc/bluetooth/main.conf

  # add basic documention
  install -dm755 ${pkgdir}/usr/share/doc/${pkgbase#lib32-}/dbus-apis
  cp -a doc/*.txt ${pkgdir}/usr/share/doc/${pkgbase#lib32-}/dbus-apis/
  # fix module loading errors
  install -dm755 ${pkgdir}/usr/lib/modprobe.d
  install -Dm644 ${srcdir}/bluetooth.modprobe ${pkgdir}/usr/lib/modprobe.d/bluetooth-usb.conf

  # Remove conflicting files.
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}
}

package_lib32-bluez-libs() {
  pkgdesc="Deprecated libraries for the bluetooth protocol stack (32-bit)"
  depends=('lib32-glibc')
  license=('LGPL2.1')

  cd ${pkgbase#lib32-}-${pkgver}
  make DESTDIR=${pkgdir} \
       install-includeHEADERS \
       install-libLTLIBRARIES \
       install-pkgconfigDATA

  # Remove conflicting files.
  rm -rf "${pkgdir}/usr/include"
}

package_lib32-bluez-cups() {
  pkgdesc="CUPS printer backend for Bluetooth printers (32-bit)"
  depends=('lib32-libdbus' 'lib32-glib2' 'cups')

  cd ${pkgbase#lib32-}-${pkgver}
  make DESTDIR=${pkgdir} install-cupsPROGRAMS
}

package_lib32-bluez-plugins() {
  pkgdesc="bluez plugins (PS3 Sixaxis controller) (32-bit)"
  depends=('lib32-systemd')

  cd ${pkgbase#lib32-}-${pkgver}
  make DESTDIR=${pkgdir} \
       install-pluginLTLIBRARIES
}
