# Maintainer: steelt <steeltitanium1 at gmail dot com>
# (Added from connman package)
# Contributor: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com>

_pkgname=connman
pkgname=connman-systemd-resolved
pkgver=1.43
pkgrel=1
pkgdesc="Intel's modular network connection manager; using systemd-resolved as the DNS backend"
url="https://01.org/connman"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(
  'dbus'
  'gcc-libs'
  'glib2'
  'glibc'
  'gnutls'
  'iptables'
  'libmnl'
  'readline'
  'systemd'
)
makedepends=(
  'bluez'
  'iwd'
  'openconnect'
  'openvpn'
  'ppp'
  'wpa_supplicant'
)
optdepends=(
  'bluez: Support for Bluetooth devices'
  'iwd: for WiFi devices'
  'openconnect: for VPN Support'
  'openvpn: for VPN Support'
  'pptpclient: for ppp support'
  'wpa_supplicant: for WiFi devices'
)
provides=(connman)
conflicts=(connman)
backup=('etc/connman/main.conf')
source=(
  "$_pkgname-$pkgver.tar.xz::https://www.kernel.org/pub/linux/network/$_pkgname/$_pkgname-$pkgver.tar.xz"
  "$_pkgname-$pkgver.tar.sign::https://www.kernel.org/pub/linux/network/$_pkgname/$_pkgname-$pkgver.tar.sign"
  "allow_group_network.diff"
)
sha512sums=('3289525cf764313700c520d3159431cdf719029096a1001d60ebdbda6406888699bc86336e7de890bf2c34a0624f3ba3081b0b57838a962b3c90bb5cd3484b38'
            'SKIP'
            '06dd5867d460f1c3cf6c359e650ca2ef24495493a99cd03dbd17f23e587e9066d9bc98758d85d5c690d1ae21fa77ad8da5e2fa83d0b52c95d7a535784c5c4964')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i "$srcdir/allow_group_network.diff"
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
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
    --enable-test \
    --enable-pie \
    --enable-iwd \
    --with-dns-backend=systemd-resolved
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm755 -t "$pkgdir/usr/bin" client/connmanctl
  install -vDm644 -t "$pkgdir/etc/connman" src/main.conf
  # See FS#48044
  sed -i 's/ProtectSystem=full/ProtectSystem=true/' "$pkgdir/usr/lib/systemd/system/connman.service"
}
