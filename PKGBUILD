# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=bibtex-tidy
pkgver=1.10.1
pkgrel=1
pkgdesc="BibTeX Tidy - Cleaner and Formatter for BibTeX files "
arch=('any')
url="https://github.com/FlamingTempura/bibtex-tidy"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'txt2man')
source=("https://registry.npmjs.org/bibtex-tidy/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('33f541444e97faf6d578a484a3296d07fa5e1f5d3090db121ce9b4ae241e6ded')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Create manpage
  mfile="$pkgdir/usr/lib/node_modules/bibtex-tidy/bibtex-tidy.0"
  sed 's/^  Options:/OPTIONS/g' $mfile > "$pkgname.0"
  txt2man -d "" -s 1 -t "$pkgname" "$pkgname.0" > "$pkgname.1"

  gzip -f "$pkgname.1"
  mkdir -p "$pkgdir/usr/share/man/man1/"
  install -g 0 -o 0 -m 0644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/"
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:`
