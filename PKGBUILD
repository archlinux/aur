# Maintainer: Paul Hentschel <aur at hpminc dot com>
# Contributor: baraclese at gmail dot com

pkgname=lwtools
pkgver=4.24
pkgrel=1
pkgdesc="Cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors."
arch=('x86_64')
url="http://www.lwtools.ca/"
license=('GPL3')
source=("http://www.lwtools.ca/releases/lwtools/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b38a2baad15c017bb7cd8144218e7af61abccf21fd25f7b1a35e6529acd7b3dd')

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
