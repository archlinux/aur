# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Original-Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Original-Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

#pkgbase=lib32-networkmanager
pkgname=lib32-networkmanager
_pkgname=NetworkManager
pkgver=1.4.0
pkgrel=1
pkgdesc="Network Management daemon, 32bit libraries"
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://www.gnome.org/projects/NetworkManager/"
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc lib32-bluez-libs
             "ppp=$_pppver" lib32-systemd rp-pppoe vala perl-yaml python-gobject modemmanager)
depends=(lib32-libnm-glib lib32-libmm-glib iproute2 lib32-polkit wpa_supplicant
           lib32-libsoup  lib32-libndp lib32-libteam lib32-libgudev networkmanager)
optdepends=('lib32-bluez: Bluetooth support')
checkdepends=(libx11 python-dbus)

#source=(https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz)

_commit=93b4119a81af57c274ac58210a8776afecf2a252
source=("git://anongit.freedesktop.org/NetworkManager/NetworkManager#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd NetworkManager

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

  cd NetworkManager
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
  cd NetworkManager
  make -k check
}

package() {

  cd NetworkManager
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C libnm uninstall
  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall

  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc" "$pkgdir/var"
}

