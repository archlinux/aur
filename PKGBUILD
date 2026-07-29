# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=bibtex-tidy
pkgver=1.15.0
pkgrel=1
pkgdesc="BibTeX Tidy - Cleaner and Formatter for BibTeX files "
arch=('any')
url="https://github.com/FlamingTempura/bibtex-tidy"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'txt2man')
source=("https://registry.npmjs.org/bibtex-tidy/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('cebe51d16c99a9881d33d52fbd477d4c2c808ca01cc33a04e0437e999a352e09')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Create manpage
    mfile="$pkgdir/usr/lib/node_modules/bibtex-tidy/bibtex-tidy.0"
    sed 's/^  Options:/OPTIONS/g' $mfile >"$pkgname.0"
    txt2man -d "" -s 1 -t "$pkgname" "$pkgname.0" >"$pkgname.1"

    gzip -f "$pkgname.1"
    mkdir -p "$pkgdir/usr/share/man/man1/"
    install -g 0 -o 0 -m 0644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/"
    chown -R root:root "${pkgdir}"

}

# vim:set ts=2 sw=2 et:`
