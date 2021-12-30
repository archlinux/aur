# Maintainer: Tea <icepie.dev@gmail.com>

_npmscope=tarojs
_npmname=cli
_npmid="@$_npmscope/$_npmname"

pkgname="${_npmscope}-${_npmname}"
pkgver=3.3.19
pkgrel=1
pkgdesc='Standard tooling for tarojs development'
arch=('any')
url='https://taro.zone'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
conflicts=('nodejs-taro-cli' 'taro-cli')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}"/usr/lib

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

  # Add license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permissions for taro templates (not grace)
  chmod -R 777 "$pkgdir/usr/lib/node_modules/$_npmid/templates"

  # warning for taro templates
  echo "WARNING: taro templates dir is in not good permission..."
}
