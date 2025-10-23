# Submitter: JP-Ellis <josh@jpellis.me>
# Maintainer: cphyc <contact@cphyc.me>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=github-copilot-cli-legacy
_pkgname="@githubnext/${pkgname%%-legacy}"
pkgver=0.1.36
pkgrel=1
pkgdesc="A CLI experience for letting GitHub Copilot help you on the command line"
arch=('any')
url="https://githubnext.com/projects/copilot-cli/"
license=('none')

makedepends=('npm' 'jq')
provides=("${pkgname%%-legacy}")
conflicts=("${pkgname%%-cli-legacy}" "${pkgname%%-legacy}")

source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname%%-legacy}-${pkgver}.tgz")
sha256sums=('72a9b4bd15d3d6d1eb1b7116653819e1b4ee0dc9b18ff7ecbdf57e9c91813b04')
noextract=("${pkgname%%-legacy}-${pkgver}.tgz")

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname%%-legacy}-${pkgver}.tgz"

  msg2 "Fixing file ownership"
  chown -R root:root "${pkgdir}"

  msg2 "Removing references to srcdir"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/${_pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
