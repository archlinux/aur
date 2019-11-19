# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: quequotion <quequotion at bugmenot dot com>
# Contributor: Tom Gundersen <teg at jklm dot no>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Geoffroy Carrier <geoffroy at archlinux dot org>

pkgbase=lib32-bluez-libs
pkgname=("${pkgbase}" 'lib32-bluez-plugins')
pkgver=5.52
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('LGPL2.1')
makedepends=('lib32-dbus' 'lib32-gcc-libs' 'lib32-glib2' 'lib32-systemd')
source=("https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar."{xz,sign}
        "refresh_adv_manager_for_non-LE_devices.diff")
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha512sums=('9024481910d1dee85578bf3d7a4fc4be2bece516e6216c91aa1a7ac18537f092b47c41c4a5506ddd7e279599d58002e98203c5439745c01df4dbc22a75234c84'
            'SKIP'
            'c6ef673956963725edc52d667648e51df5b99f820e87705096b4b9338e8a4540722e734f1e8e67998c2fbbefec30645ff1fa064789c8a858f770d1214399561d')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  cd "bluez-${pkgver}"
  patch -Np1 -i ../refresh_adv_manager_for_non-LE_devices.diff
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "bluez-${pkgver}"
  ./configure \
    --build=i686-pc-linux-gnu \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    --with-dbusconfdir=/usr/share/dbus-1 \
    --disable-monitor \
    --disable-cups \
    --disable-obex \
    --disable-client \
    --disable-tools \
    --disable-systemd \
    --disable-datafiles \
    --enable-sixaxis \
    --enable-library # this is deprecated
  make
}

check() {
  cd "bluez-${pkgver}"
  make check || /bin/true # https://bugzilla.kernel.org/show_bug.cgi?id=196621
}

package_lib32-bluez-libs() {
  pkgdesc="Deprecated libraries for the bluetooth protocol stack (32-bit)"
  depends=('bluez-libs' 'lib32-glibc')

  cd "bluez-${pkgver}"
  make DESTDIR=${pkgdir} \
    install-libLTLIBRARIES \
    install-pkgconfigDATA
}

package_lib32-bluez-plugins() {
  pkgdesc="bluez plugins (PS3 Sixaxis controller) (32-bit)"
  depends=('lib32-systemd')

  cd "bluez-${pkgver}"
  make DESTDIR=${pkgdir} \
       install-pluginLTLIBRARIES
}
