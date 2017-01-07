# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: quequotion <quequotion at bugmenot dot com>
# Contributor: Tom Gundersen <teg at jklm dot no>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Geoffroy Carrier <geoffroy at archlinux dot org>

pkgname=lib32-bluez-libs
pkgver=5.43
pkgrel=4
pkgdesc="Deprecated libraries for the bluetooth protocol stack (32-bit)"
url="http://www.bluez.org/"
arch=('x86_64')
license=('LGPL2.1')
depends=('bluez-libs' 'lib32-glibc')
makedepends=('gcc-multilib' 'gcc-libs-multilib' 'lib32-glib2')
source=("http://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar."{xz,sign})
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15'
            'SKIP')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "bluez-${pkgver}"
  ./configure \
    --build=i686-pc-linux-gnu \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    --disable-tools \
    --disable-monitor \
    --disable-udev \
    --disable-cups \
    --disable-obex \
    --disable-client \
    --disable-systemd \
    --disable-datafiles \
    --enable-library # this is deprecated
  make
}

check() {
  cd "bluez-${pkgver}"
  make check
}

package() {
  cd "bluez-${pkgver}"
  make DESTDIR=${pkgdir} \
    install-libLTLIBRARIES \
    install-pkgconfigDATA
}