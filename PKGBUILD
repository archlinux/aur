# Maintainer: ebiadsu <ebiadsu at posteo dot de>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=browser-sync
pkgname="nodejs-${_npmname}"
pkgver="2.27.7"
pkgrel=2
pkgdesc="Live CSS Reload & Browser Syncing"
arch=('any')
url="https://www.browsersync.io/"
license=('Apache')
depends=('nodejs')
makedepends=('npm>=7.4.0')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('5fd9eb399db29b61bcbc4445d2f3b1cd8426d286624c7217a85b06be7c311ce4')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  # install using npm with separate cache directory
  npm install -s -g \
	  --cache "${srcdir}/npm-cache" \
	  --prefix "${pkgdir}/usr" \
	  "${srcdir}/${_npmname}-${pkgver}.tgz"

  # fix ownership, see https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  find "$pkgdir" -type f -name package.json | while read pkgjson; do
	local tmppackage="$(mktemp)"
	jq 'del(.man)' "$pkgjson" >"$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
  done

}

# vim:set ts=2 sw=2 cc=80 et:
