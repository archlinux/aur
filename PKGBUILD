# Maintainer: XZS <d.f.fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/mozilla-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=mozilla-extension-gnotifier-git
pkgver=1.9.5
pkgrel=3
pkgdesc='Add-on for Firefox and Thunderbird to enable integration with GNOME native notification system.'
url='https://github.com/mkiol/GNotifier'
arch=('any')
license=('GPL3')
depends=('libnotify')
makedepends=('nodejs-jpm' 'unzip')
optdepends=(firefox thunderbird)

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

# Move down repository content for easier access by following functions.
prepare() {
  cp -rf --reflink=auto "$_gitname"/* .
  rm -rf "$_gitname"
  find -name '.git*' -exec rm -rf '{}' +
}

makedepends+=(rasqal)

sparql() {
  roqet -e "PREFIX em: <http://www.mozilla.org/2004/em-rdf#> SELECT ?x WHERE { $1 }" \
    -D "${2:-install.rdf}" -r csv 2>/dev/null | tr -d '\r' | tail -n 1 | head -c -1
}

# Retrieve current compatibility information from install.rdf.
query-version() {
  sparql "[] em:id '$2' ; em:${1}Version ?x" install.rdf
}

pkgver() {
  find -iname '*.json' -exec sed -n \
    's/.*"version"\s*:\s*"\([[:digit:].]*\)"\s*,.*/\1/p' \
    '{}' \; -quit 2>/dev/null | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cp -r --reflink=auto source/* .
  rm -r xpi misc *.md win8* source resources lib/{windows,osx}.js
  jpm xpi
  unzip -o *.xpi
  rm *.xpi
}

eval "package_$pkgname()" '{
  prepare_target
  cp --no-preserve=ownership,mode -r . "$destdir/$id"
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
