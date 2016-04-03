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
pkgver=1.0.12
pkgrel=1
_pppver=2.4.7
pkgdesc="NetworkManager with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("libnm-glib>=${pkgver}" 'iproute2' 'libnl' 'polkit-consolekit' 'consolekit' 
         'wpa_supplicant' 'dhclient' 'libsoup' 'libmm-glib' 'libnewt' 'libndp' 
         'libteam' 'libgudev')
makedepends=('intltool' 'iptables' 'gobject-introspection' 'gtk-doc' 
             "ppp=$_pppver" 'modemmanager' 'rp-pppoe' 'vala' 'perl-yaml' 
             'python-gobject')
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
source=(https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz
        NetworkManager.conf 
        disable_set_hostname.patch 
        networkmanager.rc
        )
sha256sums=('3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e'
            '2c6a647b5aec9f3c356d5d95251976a21297c6e64bd8d2a59339f8450a86cb3b'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460'
            'e39a2a0401518abd1d1d060200e2ca0f0854cdc49a5cb286919be177a7cd90fc')

prepare() {
  cd NetworkManager-$pkgver

  patch -Np1 -i ../disable_set_hostname.patch
  2to3 -w libnm src tools
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd NetworkManager-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
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
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-session-tracking=ck \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --enable-doc \
    --enable-gtk-doc

  make
}

package() {
  cd NetworkManager-$pkgver
  make DESTDIR="${pkgdir}" install

  make DESTDIR="$pkgdir" -C libnm uninstall
  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall
  
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib/pkgconfig"

  install -D -m644 "${srcdir}/NetworkManager.conf" "${pkgdir}/etc/NetworkManager/NetworkManager.conf"
  install -D -m755 "${srcdir}/networkmanager.rc"   "${pkgdir}/etc/rc.d/networkmanager"

  rm -r "${pkgdir}/var/run"
}
