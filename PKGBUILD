# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=linux-wifi-hotspot
pkgver=4.7.2
pkgrel=3
pkgdesc="Feature-rich wifi hotspot creator"
arch=('x86_64' 'aarch64')
url="https://github.com/lakinduakash/linux-wifi-hotspot"
license=('BSD-2-Clause')
depends=(
  'gtk3'
  'hostapd'
  'iproute2'
  'iw'
  'procps-ng'
  'qrencode'
)
optdepends=(
  "dnsmasq: For 'NATed' or 'None' Internet sharing method"
  "iptables: For 'NATed' or 'None' Internet sharing method"
  'haveged: For random MAC generation'
  'wireless_tools: if iw cannot recognize your adapter'
)
provides=('wihotspot' 'create_ap')
conflicts=('wihotspot' 'create_ap')
backup=('etc/create_ap.conf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'gcc15.patch')
sha256sums=('4c85d8c333454da6fd5f03abcf207bb5375387a95acb852b8d7629fcab65326c'
            'e174dba185dbcea85cb56bddef59ed5c443833a848dc4c7eda3f8656b8698967')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix build with GCC 15
  # https://github.com/lakinduakash/linux-wifi-hotspot/issues/468
  # https://github.com/lakinduakash/linux-wifi-hotspot/pull/481
  patch -Np1 -i ../gcc15.patch
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
