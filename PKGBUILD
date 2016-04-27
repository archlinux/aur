# Maintainer: XZS <d dot f dot fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-volume-mixer
pkgver=0.11.0
pkgrel=1
pkgdesc="Applet allowing separate configuration of pulseaudio mixers"
arch=(any)
url="https://github.com/aleho/gnome-shell-volume-mixer"
license=(GPLv2)
depends=(python)

makedepends+=(jq)
source+=("tags::${_giturl:-${url/github.com/api.github.com\/repos}/tags}")
md5sums+=('SKIP')

prepare() {
  local url="$(jq -r '.[0].tarball_url' tags)"
  local archive="${url##*/}"
  if [ ! -e "$archive" ]; then
    curl -Lo "$archive" "$url"
  fi
  tar xf "$archive"
}

pkgver() {
  jq -r '.[0].name' tags | grep -o '[[:digit:].]*$'
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

package_09_pautils() {
  cp -r --no-preserve=ownership pautils "$destdir"
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
  if [ "$max" != $(
    gnome-shell --version | grep -Po '(?<=GNOME Shell 3\.)[[:digit:]]+'
  ) ]; then
    depends+=("gnome-shell<3.$((${max%%.*} + 1))")
  fi
  unset depends[125]
}
