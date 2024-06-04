# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-debug-adapter
pkgver=1.0.9
pkgrel=2
pkgdesc='Debug Adapter Protocol server for Perl'
arch=(any)
url='https://github.com/Nihilus118/perl-debug-adapter'
license=(MIT)
depends=(nodejs perl perl-padwalker)
# makedepends=(npm)
# https://github.com/nodejs/corepack#utility-commands
_npm="corepack npm"
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::https://github.com/Nihilus118/perl-debug-adapter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(3caf79271bbad6cd7adf294dd52d460f04322b1abce6142d353694e2dff53c5b)

build() {
  cd "$srcdir/$_archive"
  $_npm install --cache "$srcdir/npm-cache"
  $_npm run compile
}

package() {
  cd "$srcdir/$_archive"

  # Install package
  $_npm install --global --install-links \
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
