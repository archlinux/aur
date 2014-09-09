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
pkgver=0.9.10.0
pkgrel=2
_pppver=2.4.7
pkgdesc="NetworkManager with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL2.1')
url="http://www.gnome.org/projects/$_pkgname/"
depends=("libnm-glib>=${pkgver}" 'iproute2' 'libnl' 'polkit-consolekit' 'consolekit' 
         'wpa_supplicant' 'dhcp-client' 'libsoup' 'libmm-glib' 'libnewt' 'libndp' 
         'libteam')
makedepends=('intltool' 'dhcpcd' 'iptables' 'gobject-introspection' 'gtk-doc' 'git' 
             "ppp=$_pppver" 'modemmanager' 'rp-pppoe' 'vala')
optdepends=('modemmanager: for modem management service'
            'dhcpcd: alternative DHCP client; does not support DHCPv6'
            'iptables: connection sharing'
            'dnsmasq: connection sharing'
            'bluez: bluetooth support'
            'openresolv: resolvconf support'
            'ppp: dialup connection support')
provides=("networkmanager=$pkgver")
replaces=('networkmanager')
conflicts=('networkmanager')
backup=('etc/NetworkManager/NetworkManager.conf')
install=networkmanager.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz
        NetworkManager.conf 
        disable_set_hostname.patch 
        networkmanager.rc
        git-fixes.patch
        )
sha256sums=('66a88346bb04d4f402540281181340313b2ec433e75aa9d9ea13f31697f9487e'
            '759db295ddae7a6dc6b29211fc0ec08695f875584d456dd146d3679e2c33e2e3'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460'
            'e39a2a0401518abd1d1d060200e2ca0f0854cdc49a5cb286919be177a7cd90fc'
            '854b5f06fed30cbab2d71544197d53a8aacdeee12ec78a7f48acb9ff31b40889')

prepare() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../git-fixes.patch
  patch -Np1 -i ../disable_set_hostname.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname-$pkgver

  AUTOPOINT="intltoolize -f -c --automake" autoreconf -fi
  ./configure \
    --prefix=/usr \
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
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-session-tracking=ck \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --enable-doc

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall
  
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib/pkgconfig"

  install -D -m644 "${srcdir}/NetworkManager.conf" "${pkgdir}/etc/NetworkManager/NetworkManager.conf"
  install -D -m755 "${srcdir}/networkmanager.rc"   "${pkgdir}/etc/rc.d/networkmanager"

  rm -r "${pkgdir}/var/run"
}
