# Maintainer: Elias Elwyn <a@jthvai.net>

pkgname=perl-debug-adapter
pkgver=2.0.1
pkgrel=1
pkgdesc='Debug Adapter Protocol server for Perl'
license=('MIT')

url='https://github.com/Nihilus118/perl-debug-adapter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nihilus118/perl-debug-adapter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ae4a792d174b6aed4baa64512d479645cb30d31ef009e916914baea59c074913')

arch=(any)
depends=(nodejs perl perl-padwalker sh)
# makedepends=(npm)
makedepends=(corepack)
_npm="corepack npm"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_npm install --cache "$srcdir/npm-cache"
  $_npm run compile
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install package
  $_npm install --global --install-links \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache"
  find "$pkgdir/usr" -type d -execdir chmod 755 \{\} +

  # Install license
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"

  # Wrap nodejs
  rm "$pkgdir/usr/bin/$pkgname"
  cat <<-EOF >"$pkgdir/usr/bin/$pkgname"
		#!/bin/sh
		exec node -- "/usr/lib/node_modules/$pkgname/out/debugAdapter.js" "$@"
	EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}
