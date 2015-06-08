# $Id: PKGBUILD 229954 2015-01-24 15:30:18Z heftig $
# Maintainer: Alejandro Perez

pkgbase=networkmanager-noscan
pkgname=networkmanager-noscan
provides=networkmanager
replaces=networkmanager
conflicts=networkmanager

pkgver=1.0.2
pkgrel=3
pkgdesc="Network Management daemon with Wi-Fi scanning disabled when already connected (improves reliability of the connection in several Wireless 
cards)"
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
url="http://www.gnome.org/projects/NetworkManager/"
_pppver=2.4.7
depends=(libnm-glib iproute2 libnl polkit wpa_supplicant dhcp-client libsoup libmm-glib libnewt
           libndp libteam)
optdepends=('dhclient: DHCPv6 support'
              'dnsmasq: connection sharing'
              'bluez: Bluetooth support'
              'openresolv: resolvconf support'
              'ppp: dialup connection support'
              'rp-pppoe: ADSL support'
              'modemmanager: cellular network support')
install=networkmanager.install
backup=('etc/NetworkManager/NetworkManager.conf')
makedepends=(intltool dhcpcd dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver"
             modemmanager dbus-glib iproute2 libnl nss polkit wpa_supplicant dhcp-client libsoup
             systemd libmm-glib rp-pppoe libnewt libndp libteam vala)
checkdepends=(libx11 python-gobject python-dbus)
source=(http://ftp.gnome.org/pub/gnome/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz
        NetworkManager.conf disable_set_hostname.patch disable_wifi_scan_when_connected.patch 0001-dns-Fix-falling-back-in-the-resolv.conf-methods.patch)
sha256sums=('359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a47055c71e96439508ff'
            '759db295ddae7a6dc6b29211fc0ec08695f875584d456dd146d3679e2c33e2e3'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460'
            'c14204de91e8b055982771aa11b57feee2fa42f04eee003e621252b320be1e31'
            '4c5cbd0871437c43c2081fe4a1e58d6464c9b960798fd57fd80a79135647e50a')

prepare() {
  cd NetworkManager-$pkgver
  patch -Np1 -i ../disable_set_hostname.patch
  patch -Np1 -i ../disable_wifi_scan_when_connected.patch
  patch -Np1 -i ../0001-dns-Fix-falling-back-in-the-resolv.conf-methods.patch
  NOCONFIGURE=1 ./autogen.sh
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
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-iptables=/usr/bin/iptables \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-pppd=/usr/bin/pppd \
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
    --with-pppoe=/usr/bin/pppoe \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-session-tracking=systemd \
    --with-modem-manager-1 \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --enable-doc

  make
}

package() {
  cd NetworkManager-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C libnm uninstall
  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall

  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib/pkgconfig"

  install -m644 ../NetworkManager.conf "$pkgdir/etc/NetworkManager/"
  install -m755 -d "$pkgdir/etc/NetworkManager/dnsmasq.d"

  rm -r "$pkgdir/var/run"
}

