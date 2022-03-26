# Maintainer: Paul Hentschel <aur at hpminc dot com>
# Contributor: baraclese at gmail dot com

pkgname=lwtools
pkgver=4.19
pkgrel=1
pkgdesc="Cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors."
arch=('x86_64')
url="http://www.lwtools.ca/"
license=('GPL3')
source=("http://www.lwtools.ca/releases/lwtools/${pkgname}-${pkgver}.tar.gz")
sha256sums=('427fec1571c876541895111536f3ccbd9243dd3b3d613f1a9e4b183d031ff681')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Install scripts and create symbolic links for gcc6809
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname" extra/ar extra/as extra/ld
  ln -s "/usr/lib/$pkgname/ar" "$pkgdir/usr/bin/m6809-unknown-ar"
  ln -s "/usr/lib/$pkgname/as" "$pkgdir/usr/bin/m6809-unknown-as"
  ln -s "/usr/lib/$pkgname/ld" "$pkgdir/usr/bin/m6809-unknown-ld"
  ln -s /usr/bin/true "$pkgdir/usr/bin/m6809-unknown-ranlib"

  # Install documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/manual/manual.{html,pdf}
}

# vim:set ts=2 sw=2 et:
