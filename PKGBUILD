# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-debug-adapter
pkgver=1.0.10
pkgrel=1
pkgdesc='Debug Adapter Protocol server for Perl'
license=('MIT')

url='https://github.com/Nihilus118/perl-debug-adapter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nihilus118/perl-debug-adapter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9d1e8e02a3a01457a14426b0751ffc1df36165cec4564d6a205037c4142a0b3b')

arch=(any)
depends=(nodejs perl perl-padwalker sh)
# makedepends=(npm)
# https://github.com/nodejs/corepack#utility-commands
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
