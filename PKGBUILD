# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>
_npmname=routahe
_npmid=routahe

pkgname="${_npmname}"
pkgver=0.2.18
pkgrel=2
pkgdesc="A command line client for finding public transporation routes in Helsinki, Finland"
arch=("any")
url="https://github.com/anttikon/routahe"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
optdepends=()
source=("http://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha512sums=("5b28b9ba8aad1308a3b3b24dde79416e55517ce99a6e7508cfb2d7c24d69d798d80b25660ff10abc80da599911e7a51bdef8e6aa4ce66e1a19beec681e97c730")

package() {
  npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]%%::*}"
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -execdir chmod 755 {} \+

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root $pkgdir

  # Package contains reference to $srcdir/$pkgdir
  find "${pkgdir}" -type f -name package.json -execdir sed -i '/_where/d' {} \+

  # Add license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
