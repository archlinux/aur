# Maintainer: oi_wtf <brainpower at gulli dot com>
# Original-Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Original-Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=lib32-networkmanager
pkgname=(lib32-networkmanager lib32-libnm-glib)
_pkgname=NetworkManager
pkgver=1.0.0
pkgrel=2
pkgdesc="Network Management daemon, 32bit libraries"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
makedepends=(intltool dhcpcd dhclient iptables gobject-introspection gtk-doc
             lib32-dbus-glib iproute2 lib32-libnl lib32-nss lib32-polkit wpa_supplicant dhcp-client
             lib32-libsoup lib32-systemd lib32-libndp lib32-libteam vala networkmanager)
checkdepends=(libx11 python-gobject python-dbus)
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz
        disable_set_hostname.patch)
sha256sums=('3a66afec670c975edd9832e620b725a5f16ed267a1b9e1b2d51ef27250d85947'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460')

prepare() {
  cd NetworkManager-$pkgver
  patch -Np1 -i ../disable_set_hostname.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
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
    --with-dhcpcd=/usr/bin/dhcpcd \
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-iptables=/usr/bin/iptables \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-nmtui=no \
    --with-session-tracking=systemd \
    --without-modem-manager-1 \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --disable-ppp \
    --enable-modify-system \
    --disable-doc \
    --disable-qt # disable qt examples, lib32-qt4 contains wrong include dirs in pkgconfig

  make
}

check() {
  cd NetworkManager-$pkgver
  #make -k check
}

package_lib32-networkmanager() {
  depends=(lib32-libnm-glib iproute2 lib32-libnl lib32-polkit wpa_supplicant dhcp-client
           lib32-libsoup  lib32-libndp lib32-libteam networkmanager)

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
  depends=(lib32-systemd lib32-nss lib32-dbus-glib)

  install -d "$pkgdir/usr/lib32"
  mv pkgconfig "$pkgdir/usr/lib32"

  cd NetworkManager-$pkgver
  make DESTDIR="$pkgdir" -C libnm install
  make DESTDIR="$pkgdir" -C libnm-util install
  make DESTDIR="$pkgdir" -C libnm-glib install

  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc"
}
