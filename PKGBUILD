# Maintainer: sumt <sumt at sci dot fi>
pkgname=palemoon-i18n-default
pkgver=27.0
pkgrel=1
pkgdesc="Pale Moon language pack for system active language."
arch=('any')
url="http://www.palemoon.org/langpacks.shtml"
license=('MPL')
depends=("palemoon>=$pkgver")
source=("lang-pref.js")
md5sums=('c654129d7633ca682436825e6eb0aead')

_locale=$(echo $LANG | awk -F'[ .@]' '{print $1}' | tr _ -)
_url=http://relmirror.palemoon.org/langpacks/${pkgver%.*}.x

declare -A _languages=(
["cs"]="Czech"
["de"x]="German"
["en-GB"]="English (U.K.)"
["es-AR"]="Spanish (Argentina)"
["es-ES"]="Spanish (Spain)"
["es-MX"]="Spanish (Mexico)"
["fr"]="French"
["hu"]="Hungarian"
["it"]="Italian"
["ja"]="Japanese"
["ko"]="Korean"
["pl"]="Polish"
["ru"]="Russian"
["zh-CN"]="Chinese (Simplified)"
)

if [ -n ${_languages[$_locale]+_} ]; then
  _langpack=palemoon-i18n-$pkgver-$_locale.xpi
  source+=("$_langpack::$_url/$_locale.xpi")
  noextract=("$_langpack")
  md5sums+=('SKIP')
fi

prepare() {
  if [ ${#source[@]} -ne 2 ]; then
    error "Language pack for $_locale not found"
    exit 1
  fi
}

package() {
  install -Dm644 "$_langpack" \
    "$pkgdir/usr/lib/palemoon/browser/extensions/langpack-$_locale@palemoon.org.xpi"
  install -Dm644 lang-pref.js \
    "$pkgdir/usr/lib/palemoon/browser/defaults/preferences/lang-pref.js"
}
