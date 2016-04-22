# Maintainer: XZS <d.f.fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/mozilla-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=firefox-extension-hide-tab-bar-with-one-tab
pkgver=1.5.1.signed
pkgrel=3
pkgdesc='Hide the tab bar if there is only one tab.'
url='http://forums.mozillazine.org/viewtopic.php?f=48&t=2141579'
license=('MPLv2')
md5sums=('0177f69d998d66a9f181b5744bee21a1')

[ "$arch" ] || arch=('any')

source+=(
  "${pkgname}.zip::https://addons.mozilla.org/firefox/downloads/latest/${pkgname#*-*-}/platform:2/"
  ".version::https://services.addons.mozilla.org/en-US/firefox/api/1.5/addon/${pkgname#*-*-}"
)
md5sums+=('SKIP')
noextract+=("${pkgname}.zip")
makedepends+=(unzip)

prepare() {
  unzip "${pkgname}.zip"
  rm ${pkgname}.zip
}

makedepends+=(rasqal)

sparql() {
  roqet -e "PREFIX em: <http://www.mozilla.org/2004/em-rdf#> SELECT ?x WHERE { $1 }" \
    -D "${2:-install.rdf}" -r csv 2>/dev/null | tr -d '\r' | tail -n 1 | head -c -1
}

pkgver() {
  sparql '<urn:mozilla:install-manifest> em:version ?x' | tr - .
}

# Retrieve current compatibility information from addons.mozilla.org API.
query-version() {
  xmllint .version --xpath \
    "//application[appID='$2']/$1_version/text()"
}
version-range() {
  local emid=$(emid $1)
  echo "$1>$(version min $emid)" "$1<$(version max $emid)"
}

emid() {
  case $1 in
    firefox)     echo '{ec8030f7-c20a-464f-9b0e-13a3a9e97384}' ;;
    thunderbird) echo '{3550f703-e582-4d05-9a08-453d09bdfdc6}' ;;
    *) return 1 ;;
  esac
}

version() {
  local version="$(query-version $1 $2)"
  if [[ $version =~ ([[:digit:]]+).\* ]]; then
    if [[ $1 = max ]]; then
      echo $(( ${BASH_REMATCH[1]} + 1 ))
    else
      echo "=${BASH_REMATCH[1]}"
    fi
  else
    echo "=$version"
  fi
}

prepare_target() {
  local target=${pkgname%%-*}
  id="$(sparql '<urn:mozilla:install-manifest> em:id ?x')"
  destdir="$pkgdir/usr/lib/${target/firefox/firefox\/browser}/extensions"
  install -d "$destdir"
}

depends=(${pkgname%%-*})

package() {
  compose_dependencies
  prepare_target
  cp --no-preserve=ownership,mode -r . "$destdir/$id"
  find "$destdir/$id" -mindepth 1 -name ".*" -exec rm -rf '{}' +
}

# Hidden from mksrcinfo in silly subfunction.
compose_dependencies() {
  depends=($(version-range ${pkgname%%-*}))
}
