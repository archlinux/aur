# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: hexchain <i at hexchain dot org>

_branch=main
_pkgname=yaml-language-server
pkgname=${_pkgname}-git
pkgver=r1483.fcbcbf9e
pkgrel=1
pkgdesc='YAML Language Server, git main build'
url="https://github.com/redhat-developer/${_pkgname}"
license=(MIT)
arch=(any)
conflicts=(yaml-language-server)
provides=(yaml-language-server)
depends=(nodejs)
makedepends=(jq yarn)
options=('!emptydirs' '!strip')
source=("${pkgname}::git+${url}.git#branch=${_branch}"
        "pin-langserver-types.patch")
sha256sums=('SKIP'
            '7f11a669b1e3e2de9e96ef3752b182aa4f2dee2ecfbdf87169752ba880736d36')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  patch -p1 < "$srcdir/pin-langserver-types.patch"
  yarn --frozen-lockfile
  yarn compile
}

check() {
  cd $pkgname
  # see: https://github.com/redhat-developer/yaml-language-server/issues/1018
  yarn test
}

package() {
  cd $pkgname

  # Emulate `npm prune --omit=dev`
  cp package.json{,.bak}
  read -ra devDependencies < <(jq -r '.devDependencies | keys | join(" ")' package.json)
  yarn install
  yarn remove --frozen-lockfile "${devDependencies[@]}"
  mv package.json{.bak,}

  install -d "$pkgdir"/usr/{bin,lib/node_modules/$_pkgname}
  ln -s ../lib/node_modules/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  cp -r bin l10n node_modules out package.json "$pkgdir"/usr/lib/node_modules/$_pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
