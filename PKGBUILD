# Maintainer: XZS <d.f.fischer at web dot de>
# Contributor: polyzen <polycitizen@gmail.com>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/mozilla-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=mozilla-extension-stylish
pkgver=2.0.6
pkgrel=1
pkgdesc='Customize your favorite web sites with user styles.'
url='https://userstyles.org/'
license=('GPL')
optdepends=(firefox thunderbird)
md5sums=('479f2f2be86d2be266e8189e1410f7e9')

[ "$arch" ] || arch=('any')

source+=(
  "${pkgname}.zip::https://addons.mozilla.org/firefox/downloads/latest/${pkgname#*-*-}/platform:2/"
  "version::https://services.addons.mozilla.org/en-US/firefox/api/1.5/addon/${pkgname#*-*-}"
)
md5sums+=('SKIP')

prepare() {
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
  xmllint version --xpath \
    "//application[appID='$2']/$1_version/text()"
}
eval "package_$pkgname()" '{
  prepare_target
  install -d "$destdir/$id"
  cp --no-preserve=ownership,mode -r * "$destdir/$id"
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

link() {
  depends+=($(version-range $1))
  unset depends[1]

  prepare_target
  ln -s "/usr/lib/mozilla/extensions/$id" "$destdir/$id"
}
