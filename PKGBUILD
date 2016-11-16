# Maintainer: XZS <d.f.fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/mozilla-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=mozilla-extension-gnotifier
pkgver=1.9.7
pkgrel=3
pkgdesc='Add-on for Firefox and Thunderbird. Replaces built-in notifications with the OS native notifications. It'
arch=('any')
license=('GPL3')
depends=('libnotify')
optdepends=(firefox thunderbird)
md5sums=('5cb3275123e67b9ca99502d875dc1d01')

[ "$arch" ] || arch=('any')

source+=(
  "${pkgname}.zip::https://addons.mozilla.org/firefox/downloads/latest/${_extname=${pkgname#*-*-}}/platform:2/"
  ".version::https://services.addons.mozilla.org/firefox/api/1.5/addon/$_extname"
)
[ ${url++} ] || url="https://addons.mozilla.org/${pkgname%%-*}/addon/$_extname/"
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
eval "package_$pkgname()" '{
  prepare_target
  cp --no-preserve=ownership,mode -r . "$destdir/$id"
  find "$destdir/$id" -mindepth 1 -name ".*" -exec rm -rf '{}' +
}'

for target in "${optdepends[@]}"; do
  local newname="${target/%/-${pkgname[0]#mozilla-}}"
  pkgname+=("$newname")
  eval "package_$newname() {
    # Unversioned package relations have to be here and not in link for mksrcinfo to find them.
    depends=(${pkgname[0]}=$pkgver $target)
    provides=(\$(if [[ $newname = *-git ]]; then echo ${newname%-git}; fi))
    conflicts=(\$(if [[ $newname = *-git ]]; then echo ${newname%-git}; fi))
    link $target
  }"
done
optdepends=()

version-range() {
  if [ -z "$(sparql "?x em:type ?type. filter(?type in ('2', '64'))")" ] ||
    [ -n "$(sparql "?x em:strictCompatibility 'true'")" ] ||
    { [ -e chrome.manifest ] &&
      grep '^binary-component[ \t]' chrome.manifest ; }
  then
    local emid=$(emid $1)
    echo "$1>$(version min $emid)" "$1<$(version max $emid)"
  else
    echo "$1>$(version min $(emid $1))"
  fi
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

link() {
  depends+=($(version-range $1))
  unset depends[1]

  prepare_target
  ln -s "/usr/lib/mozilla/extensions/$id" "$destdir/$id"
}
