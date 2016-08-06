# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Original-Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Original-Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=lib32-networkmanager
pkgname=(lib32-networkmanager lib32-libnm-glib)
_pkgname=NetworkManager
pkgver=1.2.4
pkgrel=1
pkgdesc="Network Management daemon, 32bit libraries"
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://www.gnome.org/projects/NetworkManager/"
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc lib32-bluez-libs
             "ppp=$_pppver" lib32-dbus-glib iproute2 lib32-nss lib32-polkit wpa_supplicant
             lib32-libsoup lib32-systemd lib32-libgudev lib32-libndp lib32-libmm-glib rp-pppoe
             lib32-libteam vala perl-yaml python-gobject networkmanager modemmanager)
checkdepends=(libx11 python-dbus)
source=(https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz)

sha256sums=('19bfb7306dd472d010443a8027d91f9fd50fe6e0c5aa4ea8083845de0fa38faa')

prepare() {
  cd NetworkManager-$pkgver

  2to3 -w libnm src tools

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export PATH="$srcdir/path:$PATH"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  # enable this and comment out the LIBDIR if you want or need the old PKG_CONFIG behavior.
  #export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  export LIBRARY_PATH="/usr/lib32:$LIBRARY_PATH"

  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib/networkmanager \
    --with-crypto=nss \
    --with-dhclient=/usr/bin/dhclient \
    --without-dhcpcd \
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-iptables=/usr/bin/iptables \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-pppd=/usr/bin/pppd \
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
    --with-pppoe=/usr/bin/pppoe \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-nmtui=no \
    --with-session-tracking=systemd \
    --with-modem-manager-1 \
    --with-libaudit=no \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --disable-doc \
    --disable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

check() {
  cd NetworkManager-$pkgver
  make -k check
}

package_lib32-networkmanager() {
  depends=(lib32-libnm-glib lib32-libmm-glib iproute2 lib32-polkit wpa_supplicant
           lib32-libsoup  lib32-libndp lib32-libteam lib32-libgudev networkmanager)
  optdepends=('lib32-bluez: Bluetooth support')

  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C libnm uninstall
  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall

  # Some stuff to move is left over
  mv "$pkgdir/usr/lib32/pkgconfig" ..

  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc" "$pkgdir/var"
}

package_lib32-libnm-glib() {
  pkgdesc="NetworkManager library"
  depends=(lib32-libgudev lib32-nss lib32-dbus-glib lib32-util-linux)

  install -d "$pkgdir/usr/lib32"
  mv pkgconfig "$pkgdir/usr/lib32"

  cd NetworkManager-$pkgver
  make DESTDIR="$pkgdir" -C libnm install
  make DESTDIR="$pkgdir" -C libnm-util install
  make DESTDIR="$pkgdir" -C libnm-glib install
  make DESTDIR="$pkgdir" -C vapi install

  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc"
}
