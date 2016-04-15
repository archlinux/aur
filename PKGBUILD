# Maintainer: XZS <d dot f dot fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-coverflow-alt-tab
pkgver=1.2
pkgrel=1
pkgdesc="Replacement of Alt-Tab, iterates through windows in a cover-flow manner"
arch=('any')
url="https://github.com/dmo60/CoverflowAltTab"
license=('GPL')

makedepends+=(jq)
source+=("${_giturl:-release::${url/github.com/api.github.com\/repos}/releases/latest}")
md5sums+=('SKIP')

prepare() {
  local url="$(jq -r '.assets[0].browser_download_url' release)"
  local archive="${url##*/}"
  if [ ! -e "$archive" ]; then
    curl -Lo "$archive" "$url"
  fi
  unzip -o "$archive"
}

pkgver() {
  jq -r .tag_name release | grep -o '[[:digit:].]*$'
}
package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}
package_01_locate() {
  msg2 'Locating extension...'
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$extname"
}

package_02_install() {
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "$destdir" '{}' +
}
package_10_locale() {
  msg2 'Installing translations...'
  (
    cd locale
    for locale in */
    do
      install -Dm644 -t "$pkgdir/usr/share/locale/$locale/LC_MESSAGES" "$locale/LC_MESSAGES"/*.mo
    done
  )
}
if [ -z "$install" ]
then
  install=gschemas.install
fi

package_10_schemas() {
  msg2 'Installing schemas...'
  find -name '*.xml' -exec install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" '{}' +
}
depends[125]=gnome-shell

package_20_version() {
  local compatibles=($(\
    find -path ./pkg -type d -prune -o \
    -name metadata.json -exec cat '{}' \; | \
    tr -d '\n' | grep -Po '(?<="shell-version": \[)[^\[\]]*(?=\])' | \
    tr '\n," ' '\n' | sed 's/3\.//g;/^$/d' | sort -n -t. -k 1,1))
  depends+=("gnome-shell>=3.${compatibles[0]}")
  local max="${compatibles[-1]}"
  if [ "3.$max" != $(
    gnome-shell --version | grep -Po '(?<=GNOME Shell 3\.)[[:digit:]]+'
  ) ]; then
    depends+=("gnome-shell<3.$((${max%%.*} + 1))")
  fi
  unset depends[125]
}
