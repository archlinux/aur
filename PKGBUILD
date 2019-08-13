# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: j605

_npmname=triton
pkgname=nodejs-$_npmname
pkgver=7.4.0
pkgrel=1
pkgdesc="triton is a CLI tool for working with the CloudAPI for Joyent's Triton Public Cloud and Private Cloud"
arch=('any')
url="https://github.com/joyent/node-triton"
license=('MPL')
depends=('nodejs')
makedepends=('npm' 'jq')
source=($pkgname-$pkgver.tar.gz::"https://github.com/joyent/node-triton/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('7d0e4622d0ab0d4dd6917d3c8a6f2353c75b38c3cedaedf608f315a874d86acd')

package() {
  npm install --cache "${srcdir}"/npm-cache --no-optional -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tar.gz"

  install -dm755 "${pkgdir}"/etc/bash_completion.d
  "${pkgdir}"/usr/bin/triton completion > "${pkgdir}"/etc/bash_completion.d/triton

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i '/_where/d'
  for pkgjson in `find "$pkgdir" -type f -name package.json`; do
    local tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("man")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done

  # Remove references to $srcdir
  for pkgjson in `find "$pkgdir" -type f -name package.json`; do
    local tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done
}

# vim: ts=2 sw=2 et:
