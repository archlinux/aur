pkgname=backslash
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightning-fast command launcher that helps you launch commands, run apps, and streamline your workflow—all while embracing the quirky spirit of Linux!"
arch=('x86_64')
url="https://github.com/backslash-app"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('yarn' 'git')
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/backslash-app/backslash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('748a1287a4d32b6539a8dc08b8a06d5d89326912d50f76d47829df64d777fcc8')

prepare() {
  cd "$pkgname-$pkgver"
  yarn install --frozen-lockfile
}

build() {
  cd "$pkgname-$pkgver"
  yarn build
	yarn run postinstall
}

package() {
  cd "$pkgname-$pkgver"

  # Install the app
  install -d "$pkgdir/usr/lib/$pkgname"
	cp -r out/* "$pkgdir/usr/lib/$pkgname"
  cp -r node_modules "$pkgdir/usr/lib/$pkgname"

  # Create a launcher script
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec electron /usr/lib/$pkgname/main/index.js
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname-$pkgver/resources/icon.png" "$pkgdir/usr/share/pixmaps/backslash.png"
}
