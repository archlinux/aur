# Maintainer: Samantha McVey <samantham@posteo.net>
# This is derived from the Arch Linux community package connman.  Thanks to the contributors to
# that package are listed below:
#
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com>
basepkgname=connman
pkgname=${basepkgname}-nmcompat
pkgver=1.33
pkgrel=1
pkgdesc="Connman network manager with NetworkManager compatibility for all NM aware applications"
url="https://01.org/connman"
arch=('i686' 'x86_64')
license=('GPL2')
provides=('connman')
depends=('dbus' 'iptables' 'gnutls' 'glib2')
optdepends=('bluez: Support for Bluetooth devices'
            'wpa_supplicant: For WiFi devices'
            'pptpclient: for ppp support')
makedepends=('bluez' 'wpa_supplicant' 'openconnect' 'openvpn' 'ppp')
source=("http://www.kernel.org/pub/linux/network/${basepkgname}/${basepkgname}-${pkgver}.tar.xz" 'allow_group_network.diff')
md5sums=('c51903fd3e7a6a371d12ac5d72a1fa01'
         'a8d22ee089fb0ed725130d16ad393047')

prepare(){
  cd $basepkgname-$pkgver
  patch -Np1 -i "$srcdir/allow_group_network.diff"
}

build() {
  cd $basepkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --with-systemdunitdir=/usr/lib/systemd/system \
      --enable-pptp \
      --enable-openconnect \
      --enable-vpnc \
      --enable-openvpn \
      --enable-polkit \
      --enable-nmcompat \
      --enable-client

  make
}

package() {
  make -C $basepkgname-$pkgver DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/$basepkgname-$pkgver/client/${basepkgname}ctl" "$pkgdir/usr/bin/${basepkgname}ctl"
  find "$pkgdir/usr" -name \*.service -exec sed -i 's/s\(bin\)/\1/' {} +
# See FS#48044
  sed -i 's/ProtectSystem=full/ProtectSystem=true/' "$pkgdir"/usr/lib/systemd/system/connman.service
  rm -r "$pkgdir"/usr/lib/tmpfiles.d
}
