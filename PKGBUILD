# Maintainer: Phaylali <admin@omniversify.com>

pkgname=envirify
pkgver=1.0.0
pkgrel=1
pkgdesc='Material 3 GUI to view and edit every environment variable on your system — Arch GUI Environment Manager by Omniversify (built from source)'
arch=('x86_64')
url='https://github.com/phaylali/envirify'
license=('Unlicense')
depends=('gtk3')
makedepends=('flutter' 'git')
conflicts=('envirify-bin')
options=('!strip' '!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21076163ef119bc6de924acf47f6fd76396605d3adf5dd2cba1939af8f293b25')

build() {
  cd "$pkgname-$pkgver"
  export PUB_CACHE="$srcdir/.pub-cache"
  flutter config --no-analytics >/dev/null
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$pkgname-$pkgver/build/linux/x64/release/bundle"

  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a data lib "$pkgdir/opt/$pkgname/"
  install -Dm755 envirify "$pkgdir/opt/$pkgname/envirify"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/envirify" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname-$pkgver/packaging/envirify.desktop" \
    "$pkgdir/usr/share/applications/envirify.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/assets/icon-256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/envirify.png"
}
