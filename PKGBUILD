# Maintainer: Nick Boughton (nicholasboughton@gmail.com)

_npmscope=quasar
_npmname=icongenie
_npmid="@$_npmscope/$_npmname"

pkgname="${_npmscope}-${_npmname}"
pkgver=2.5.3
pkgrel=1
pkgdesc='CLI tool for building web application icons'
arch=('any')
url=https://quasar.dev/icongenie
license=('MIT')
depends=('nodejs>=10.0.0')
makedepends=('npm>=5.0.0')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
# Get SHASUM:  curl -s "https://registry.npmjs.org/@quasar/icongenie" | jq '.versions."2.5.2".dist.shasum'
sha1sums=('7b0b45ac2b1df7f2ae7ec6a1f311c89bb8222500')
options=(!strip)

package() {
 # Setting temporary cache
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]%%::*}"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -execdir chmod 755 {} \+

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root $pkgdir

  # Package contains reference to $srcdir/$pkgdir
  find "${pkgdir}" -type f -name package.json -execdir sed -i '/_where/d' {} \+
  
  # print first line (the '{' symbol) and lines from the first non-underscored key to the end
  # (npm internal keys are underscored but we don't need these keys)
  # sed -i -n '1p;/  "[^_].*": {$/,$p' "$pkgdir"/usr/lib/node_modules/"$_npmid"/package.json

  # Add license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

