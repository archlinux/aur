# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: DaZ <daz.root+arch@gmail.coM>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=networkmanager-consolekit
_pkgname=NetworkManager
pkgver=0.9.8.10
pkgrel=1
pkgdesc="NetworkManager with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/$_pkgname/"
depends=('dbus-glib' 'iproute2' 'libnl' 'nss' 'polkit-consolekit' 'consolekit' 'wpa_supplicant' 'dhcp-client' 'libsoup' 'libmm-glib')
makedepends=('intltool' 'dhcpcd' 'iptables' 'gobject-introspection' 'gtk-doc' 'git' 'ppp' 'modemmanager')
optdepends=('modemmanager: for modem management service'
            'dhcpcd: alternative DHCP client; does not support DHCPv6'
            'iptables: Connection sharing'
            'dnsmasq: Connection sharing'
            'bluez: Bluetooth support'
            'openresolv: resolvconf support'
            'ppp: Dialup connection support')
provides=("networkmanager=$pkgver")
replaces=('networkmanager')
conflicts=('networkmanager')
backup=('etc/NetworkManager/NetworkManager.conf')
install=networkmanager.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz
        NetworkManager.conf 
        disable_set_hostname.patch 
        networkmanager.rc
        )
sha256sums=('064d27223d3824859df12e1fb25b787fec1c68bbc864dc52a0289b9211c4c972'
            '44b048804c7c0b8b3b0c29b8632b6ad613c397d0a1635ec918e10c0fbcdadf21'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460'
            'e39a2a0401518abd1d1d060200e2ca0f0854cdc49a5cb286919be177a7cd90fc')

prepare() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../disable_set_hostname.patch
}

build() {
  cd $_pkgname-$pkgver

  AUTOPOINT="intltoolize -f -c --automake" autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --sbindir=/usr/bin \
    --with-crypto=nss \
    --with-dhclient=/usr/bin/dhclient \
    --with-dhcpcd=/usr/bin/dhcpcd \
    --with-iptables=/usr/bin/iptables \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-session-tracking=ck \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --enable-doc \
    --with-pppd-plugin-dir=/usr/lib/pppd/2.4.6

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/NetworkManager.conf" "${pkgdir}/etc/NetworkManager/NetworkManager.conf"
  install -D -m755 "${srcdir}/networkmanager.rc"   "${pkgdir}/etc/rc.d/networkmanager"

  rm -r "${pkgdir}/var/run"
}
