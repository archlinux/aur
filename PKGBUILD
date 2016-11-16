# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: quequotion <quequotion at bugmenot dot com>
# Contributor: Tom Gundersen <teg at jklm dot no>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Geoffroy Carrier <geoffroy at archlinux dot org>

pkgbase=lib32-bluez
pkgname=(${pkgbase}{,-libs,-cups,-plugins})
pkgver=5.43
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
makedepends=('gcc-multilib' 'gcc-libs-multilib' 'lib32-dbus' 'lib32-glib2' 'lib32-libical' 'lib32-readline' 'lib32-systemd')
source=("http://www.kernel.org/pub/linux/bluetooth/${pkgbase#lib32-}-${pkgver}.tar."{xz,sign})
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15'
            'SKIP')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgbase#lib32-}-${pkgver}"
  ./configure \
    --build=i686-pc-linux-gnu \
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
  cd "${pkgbase#lib32-}-${pkgver}"
  make check
}

package_lib32-bluez() {
  pkgdesc="Daemons for the bluetooth protocol stack (32-bit)"
  depends=(lib32-{libical,dbus,glib2})

  cd "${pkgbase#lib32-}-${pkgver}"
  make DESTDIR=${pkgdir} \
    install-libexecPROGRAMS \
    install-dbussessionbusDATA \
    install-systemdsystemunitDATA \
    install-systemduserunitDATA \
    install-dbussystembusDATA \
    install-dbusDATA \
    install-man8

  # Remove conflicting files.
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}
}

package_lib32-bluez-libs() {
  pkgdesc="Deprecated libraries for the bluetooth protocol stack (32-bit)"
  depends=('bluez-libs' 'lib32-glibc')
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
  depends=('lib32-dbus' 'lib32-glib2' 'cups')

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
