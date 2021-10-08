# Maintainer: Kristen McWilliam <merritt_public at outlook dot com>
# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=nyrna
pkgver=2.2.0
pkgrel=2
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
arch=('x86_64')
url="https://github.com/Merrit/nyrna"
license=('GPL3')
depends=('clang' 'cmake' 'glib2' 'gtk3' 'ninja' 'util-linux' 'wmctrl' 'xdotool' 'xz')
makedepends=('flutter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Merrit/nyrna/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88a288a56a60c5a9262da330fff44ba6f09e3a5801105f247a96f4b3345850eb')

prepare() {
  flutter="flutter --suppress-analytics"

  cd "$pkgname-$pkgver"
  $flutter clean
  $flutter pub get
}



build() {
  flutter="flutter --suppress-analytics"

  # Check if linux-desktop build is enabled, if not enable it for this build
  $flutter config | grep -qE '^\s*enable-linux-desktop: true\b' || flutter_set_linux=y
  flutter_set_linux="$?"
  [ "$flutter_set_linux" == "y" ] || $flutter config --enable-linux-desktop

  cd "$pkgname-$pkgver"
  $flutter build linux

  # Cleanup
  [ "$flutter_set_linux" == "y" ] || $flutter config --no-enable-linux-desktop
}

package() {
  install -dm0755 "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/data" "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/lib" "$pkgdir/opt/$pkgname"
  install -Dm0755 "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/$pkgname" "$pkgdir/opt/$pkgname"

  install -dm0755 "$pkgdir/usr/bin/"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm0644 "$srcdir/$pkgname-$pkgver/packaging/linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm0644 "$srcdir/$pkgname-$pkgver/assets/icons/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

