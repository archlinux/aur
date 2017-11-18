# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Maintainer: Cedric Staub <cs+aur@cssx.cc>
# Maintainer: Felix Morgner <felix.morgner@gmail.com>

pkgname=dnssec-trigger
pkgver=0.14
pkgrel=1
pkgdesc="Reconfigures the local unbound DNS server to use DNSSEC enabled forwarders"
arch=('i686' 'x86_64')
url="http://www.nlnetlabs.nl/projects/dnssec-trigger/"
license=('BSD')
depends=('gtk2' 'ldns' 'unbound')
backup=('etc/dnssec.conf'
        'etc/dnssec-trigger/dnssec-trigger.conf')
source=(http://www.nlnetlabs.nl/downloads/dnssec-trigger/$pkgname-$pkgver.tar.gz
        dnssec-triggerd.service
        dnssec-triggerd-keygen.service
        gtk-update-icon-cache-invocation.patch)
sha256sums=('f8d2cf7f451f713be0505c9e4b26bc10ac299a84cd489afe80d3ddd9aa55cf5b'
            'c8ed3ef4ec9cba0bd00f47bfbf0e59c318130615aca4370bc597d98365445be9'
            '831f2cf40687325d50fcc11a74050198d9a24f230749e3570cf9153abf3db12e'
            '5710dd86e0b8534096274ace3fe6cd224c440a6e86f4ed6bbdb0753146717121')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/gtk-update-icon-cache-invocation.patch"
  sed -i "s!/usr/libexec/!/usr/lib/$pkgname/!g" 01-dnssec-trigger.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/$pkgname \
    --with-keydir=/etc/dnssec-trigger ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp "$srcdir/dnssec-triggerd.service" "$pkgdir/usr/lib/systemd/system/"
  cp "$srcdir/dnssec-triggerd-keygen.service" "$pkgdir/usr/lib/systemd/system/"
  rm -f "$pkgdir/etc/xdg/autostart/dnssec-trigger-panel.desktop"
  rm -rf "$pkgdir/var"
}

# vim: ts=2:sw=2:et
