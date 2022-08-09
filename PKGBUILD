# Maintainer: Kristen McWilliam <merritt_public at outlook dot com>
# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=nyrna
pkgver=2.5.0
pkgrel=1
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
arch=('x86_64')
url="https://github.com/Merrit/nyrna"
license=('GPL3')
depends=('glib2' 'gtk3' 'libkeybinder3' 'util-linux' 'wmctrl' 'xdotool' 'xz')
makedepends=('flutter' 'clang' 'cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Merrit/nyrna/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf63de43b03d694a2736b933f45f2442adffec061021b3a29a6b629bbe32a866')

# Check Flutter configuration
flutter="flutter --suppress-analytics"
flutter_channel=$($flutter config --version | head -n1 | awk '{print $5}')
$flutter config | grep -qE '^\s*enable-linux-desktop: true\b' || flutter_set_linux=y
flutter_set_linux="$?"

prepare() {
  # Switch to Beta channel if necessary
  if [ "$flutter_channel" != "beta" ]; then
    $flutter channel beta
    $flutter upgrade
  fi

  # Enable linux-desktop builds if necessary
  if [ "$flutter_set_linux" != "y" ];then
    $flutter config --enable-linux-desktop
  fi

  cd "$pkgname-$pkgver"
  $flutter clean
  $flutter pub get
}

build() {
  cd "$pkgname-$pkgver"
  $flutter build linux
}

check() {
  # Cleanup
  if [ "$flutter_channel" != "beta" ]; then
    $flutter channel "$flutter_channel"
    $flutter upgrade
  fi

  if [ "$flutter_set_linux" != "y" ];then
    $flutter config --no-enable-linux-desktop
  fi
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
