pkgname=hostapd-mana-bin
pkgver=2.6.5.r31.ge167908
pkgrel=1
pkgdesc="SensePost's modified hostapd for rogue access point (evilAP) attacks (KARMA, EAP)"
arch=('x86_64')
url="https://github.com/sensepost/hostapd-mana"
license=('BSD')
depends=('openssl' 'libnl')
makedepends=('git' 'gcc' 'make' 'pkg-config')
source=("$pkgname::git+https://github.com/sensepost/hostapd-mana.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo "2.10"
}

build() {
  cd "$srcdir/$pkgname/hostapd"
  if [ ! -f .config ]; then
    cp defconfig .config
  fi
  echo "CONFIG_LIBNL32=y" >> .config
  make
}

package() {
  cd "$srcdir/$pkgname/hostapd"
  install -Dm755 hostapd "$pkgdir/usr/bin/hostapd-mana"
  install -Dm755 hostapd_cli "$pkgdir/usr/bin/hostapd-mana_cli"
  install -Dm644 ../README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
