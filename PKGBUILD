# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-debug-adapter
pkgver=1.0.7
pkgrel=2
pkgdesc='Debug Adapter Protocol server for Perl'
arch=(any)
url='https://github.com/Nihilus118/perl-debug-adapter'
license=(MIT)
depends=(nodejs perl perl-padwalker)
makedepends=(npm)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::https://github.com/Nihilus118/perl-debug-adapter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(4c8b08dc0e9dae4d607b1566490e43fe9e422911df4727ca1c1b5d19b59c9391)

build() {
  cd "$srcdir/$_archive"
  npm install --cache "$srcdir/npm-cache"
  npm run compile
}

package() {
  cd "$srcdir/$_archive"

  # Install package
  npm install --global --install-links \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache"
  find "$pkgdir/usr" -type d -execdir chmod 755 \{\} +

  # Install license
  install -D --mode=644 \
    --target-directory="$pkgdir/usr/share/licenses/$pkgname" LICENSE.md

  # Wrap nodejs
  rm "$pkgdir/usr/bin/$pkgname"
  cat <<-EOF >"$pkgdir/usr/bin/$pkgname"
		#!/bin/sh
		exec node -- "/usr/lib/node_modules/$pkgname/out/debugAdapter.js" "$@"
	EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}
