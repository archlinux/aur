# Maintainer: XZS <d dot f dot fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-activities-config
pkgver=42
pkgrel=1
pkgdesc="Configure the Activities Button with the Activities Configurator Extension and the Gnome Shell Extension Preferences Tool."
arch=(any)
url="https://extensions.gnome.org/extension/358/activities-configurator/"
license=(GPLv2)
source=("extension.html::$url"
        'archlinux-logo-gray-scalable.svg')
md5sums=('SKIP'
         '69063bc3433d20d9de0f9dce2269186b')

find_version() {
  if [ ! -d version ]; then
    grep -Po '(?<=data-svm=").*(?=")' extension.html |  # extract version information
    sed 's/&quot;/"/g' |  # unescape quotes
    sed 's/[{ ,]*"[[:digit:].]\+": {"pk": \([[:digit:]]\+\), "version": \([[:digit:]]\+\)}[ ,}]*/\2 \1\n/g' |  # list one version per line
    sort -nr | head -n1 | tr ' ' '\n' > version  # get newest and write
  fi
}

pkgver() {
  find_version
  head -n1 version
}

prepare() {
  find_version
  local name=$(tail -n1 version).shell-extension.zip
  if [ ! -f $name ]
  then
    curl -LO "https://extensions.gnome.org/review/download/$name"
    unzip -od extension $name
  fi
}

build() {
  cd extension
  sed -i '/^const ICON_FILE =.*$/{
    s|face-smile-3.svg|archlinux-logo-gray-scalable.svg|;
    s|//.*|// Arch Linux Icon.|}' keys.js
  cp --remove-destination ../archlinux-logo-gray-scalable.svg archlinux-logo-gray-scalable.svg
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
depends+=(gnome-shell-extensions)

package_03_unify_conveniencejs() {
  ln -fs \
    ../user-theme@gnome-shell-extensions.gcampax.github.com/convenience.js \
    "$destdir/convenience.js"
}

package_09_icon() {
  install -Dm644 *.svg "$destdir"
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
