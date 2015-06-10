# $Id: PKGBUILD 211827 2014-04-27 16:57:26Z heftig $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-ifupdown
pkgname=(networkmanager-ifupdown libnm-glib-ifupdown)
pkgver=0.9.8.10
pkgrel=5
pkgdesc="Network Management daemon"
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
url="http://www.gnome.org/projects/NetworkManager/"
makedepends=(intltool dhcpcd dhclient iptables gobject-introspection gtk-doc git ppp modemmanager
	     dbus-glib iproute2 libnl nss polkit wpa_supplicant dhcp-client libsoup systemd
	     libmm-glib)
#source=(git://anongit.freedesktop.org/NetworkManager/NetworkManager#commit=93c1041
source=(http://ftp.gnome.org/pub/gnome/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz
        NetworkManager.conf disable_set_hostname.patch)
sha256sums=('064d27223d3824859df12e1fb25b787fec1c68bbc864dc52a0289b9211c4c972'
            '44b048804c7c0b8b3b0c29b8632b6ad613c397d0a1635ec918e10c0fbcdadf21'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460')

prepare() {
  cd NetworkManager-$pkgver
  patch -Np1 -i ../disable_set_hostname.patch
}

build() {
  cd NetworkManager-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/networkmanager \
    --with-crypto=nss \
    --with-dhclient=/usr/bin/dhclient \
    --with-dhcpcd=/usr/bin/dhcpcd \
    --with-iptables=/usr/bin/iptables \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-session-tracking=systemd \
    --with-modem-manager-1 \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --enable-doc \
    --enable-ifupdown \
    --with-pppd-plugin-dir=/usr/lib/pppd/2.4.6

  make V=0
}

package_networkmanager-ifupdown() {
  depends=(libnm-glib-ifupdown iproute2 libnl polkit wpa_supplicant dhcp-client libsoup libmm-glib)
  optdepends=('dhclient: DHCPv6 support'
              'dnsmasq: Connection sharing'
              'bluez: Bluetooth support'
              'openresolv: resolvconf support'
              'ppp: Dialup connection support')
  provides=(networkmanager=$pkgver)
  conflicts=(networkmanager)
  install=networkmanager.install
  backup=('etc/NetworkManager/NetworkManager.conf')

  cd NetworkManager-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall

  # Some stuff to move is left over
  mv "$pkgdir/usr/include" ..
  mv "$pkgdir/usr/lib/pkgconfig" ..

  install -m644 ../NetworkManager.conf "$pkgdir/etc/NetworkManager/"
  install -m755 -d "$pkgdir/etc/NetworkManager/dnsmasq.d"

  rm -r "$pkgdir/var/run"
}

package_libnm-glib-ifupdown() {
  pkgdesc="NetworkManager library"
  depends=(libsystemd nss dbus-glib libutil-linux)
  provides=(libnm-glib=$pkgver)
  conflicts=(libnm-glib)

  install -d "$pkgdir/usr/lib"
  mv include "$pkgdir/usr"
  mv pkgconfig "$pkgdir/usr/lib"

  cd NetworkManager-$pkgver
  make DESTDIR="$pkgdir" -C libnm-util install
  make DESTDIR="$pkgdir" -C libnm-glib install
  make DESTDIR="$pkgdir" -C vapi install
}
