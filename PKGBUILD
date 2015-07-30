# Maintainer: XZS <d.f.fischer at web dot de>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/mozilla-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgbase='firefox-theme-adwaita-git'
_gitname=${pkgbase%-git}
pkgname=('firefox-theme-gnome-git' 'firefox-extension-gnome-theme-tweak-git')
pkgver=35.1.r1398.5cb13b5
pkgrel=1
pkgdesc="Adwaita theme for Firefox (Matches the default Gnome Shell theme)"
url="https://github.com/gnome-integration-team/firefox-gnome"
arch=('any')
license=('MPL')
depends=("firefox")
provides=('firefox-theme-gnome')
conflicts=('firefox-theme-gnome')
makedepends=('unzip' 'zip')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=($_gitname)
conflicts+=($_gitname)

# Move down repository content for easier access by following functions.
prepare() {
  cp -rf --reflink=auto "$_gitname"/* .
  rm -rf "$_gitname"
  find -name '.git*' -exec rm -rf '{}' +
}

pkgver() {
  cd "$_gitname"
  sed -n 's/.*"version"\s*:\s*"\([[:digit:].]*\)"\s*,.*/\1/p' \
    *.json 2>/dev/null | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  ./make-xpi.py
}

makedepends+=(rasqal)

sparql() {
  roqet -e "PREFIX em: <http://www.mozilla.org/2004/em-rdf#> SELECT ?x WHERE { $1 }" \
    -D "${2:-install.rdf}" -r csv 2>/dev/null | tr -d '\r' | tail -n 1 | head -c -1
}

prepare_target() {
  local target=${pkgname%%-*}
  id="$(sparql '<urn:mozilla:install-manifest> em:id ?x')"
  destdir="$pkgdir/usr/lib/${target/firefox/firefox\/browser}/extensions"
  install -d "$destdir"
}

package() {
  cd .build/$1
  prepare_target
  unzip -d "$destdir/$id" ../../gnome-firefox-$1.xpi
}

package_firefox-theme-gnome-git() {
  package theme
}

package_firefox-extension-gnome-theme-tweak-git() {
  provides=('firefox-extension-gnome-theme-tweak')
  conflicts=('firefox-extension-gnome-theme-tweak')
  pkgdesc='Extension for customizing GNOME theme.'
  depends=('firefox-theme-gnome')

  package extension
}
