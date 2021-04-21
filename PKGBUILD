# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

_npmname=expo-cli
_npmid=expo-cli

pkgname="${_npmname}"
pkgver=4.4.2
pkgrel=1
pkgdesc="Tools for creating, running, and deploying Universal Expo and React Native apps"
arch=("any") url="https://expo.io"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha512sums=("a1aa73b18e02e19a3759d12ea27e6ca57b79cdb8b232dd98db6c6f88f79e19da381839f36ae42c6cab6c3ea1c63ad7fbd30744e3689fddd07c7491f431a21e51")

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

  # print first line (the '{' symbol) and lines from the first non-underscored key to the end
  # (npm internal keys are underscored but we don't need these keys)
  sed -i -n '1p;/  "[^_].*": {$/,$p' "$pkgdir"/usr/lib/node_modules/"$_npmid"/package.json
  sed -i "s|$pkgdir||" "$pkgdir"/usr/lib/node_modules/"$_npmid"/node_modules/sshpk/package.json

  # Add license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
