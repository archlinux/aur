# Maintainer: Felix Höffken <felix at ctrl.alt.coop>

_npmname=@nestjs/cli
_npmver=10.1.10
_srcname="cli-${_npmver}.tgz"
pkgname=nodejs-nestjs-cli
pkgver=${_npmver}
pkgrel=0
pkgdesc="The command line interface for nestjs"
arch=(any)
url='https://docs.nestjs.com/cli/overview'
license=()
depends=('npm' 'jq' 'typescript')
optdepends=()
source=(http://registry.npmjs.org/${_npmname}/-/${_srcname})
noextract=(${_srcname})
sha256sums=('9689ad7f4af84992055fd92a8ae401f5718bc5ccfb2b032103dcbd8253e8062f')

package() {
  npm install --cache "${srcdir}/npm-cache" -g --prefix "$pkgdir/usr" "${srcdir}/${_srcname}"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
