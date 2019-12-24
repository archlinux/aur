# Based on the files created for Arch Linux by:
# Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
# Daniel Wallace <danielwallace at gtmanfred dot com>
# Lucas De Marchi <lucas.de.marchi@gmail.com>
# Tailinchu <tailinchu at gmail dot com>
# tormen <quickhelp@gmail.com>
# Maintainer: Andrey Vetrov <vetrov at mail dot ru>

pkgname=connman-git
pkgver=1.37.r131.g2347aded
pkgrel=1
pkgdesc="Intel's modular network connection manager. Git version."
url="https://01.org/connman"
arch=('x86_64')
license=('GPL2')
provides=("connman=$pkgver")
conflicts=('connman')
replaces=('connman')
makedepends=('bluez' 'wpa_supplicant' 'openconnect' 'openvpn' 'ppp' 'iwd')
depends=('dbus' 'iptables' 'gnutls' 'glib2')
optdepends=('bluez: Support for Bluetooth devices'
            'wpa_supplicant: for WiFi devices'
            'pptpclient: for ppp support'
            'openvpn: for VPN Support'
            'iwd: for WiFi devices')
source=("git+https://git.kernel.org/pub/scm/network/connman/connman.git"
        'allow_group_network.diff')
sha512sums=('SKIP' 'SKIP')

pkgver() {
    cd ${pkgname%-*}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd ${pkgname%-*}
  patch -Np1 -i "${srcdir}/allow_group_network.diff"
}

build() {
	cd "$srcdir/${pkgname%-*}"
        autoreconf --install
        autoconf

        ./configure --prefix=/usr \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --bindir=/usr/bin \
            --sbindir=/usr/bin \
            --with-systemdunitdir=/usr/lib/systemd/system \
            --enable-pptp \
            --enable-openconnect \
            --enable-vpnc \
            --enable-openvpn \
            --enable-polkit \
            --enable-client \
            --enable-nmcompat \
            --enable-pie \
            --enable-iwd
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir" install
}
