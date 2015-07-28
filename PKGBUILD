# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Pi3R1k <pierrick.brun at gmail dot com>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-window-buttons-git
pkgver=10_e.g.o.r13.g23a7307
pkgrel=1
pkgdesc="Extension which puts minimize, maximize and close buttons in the top panel."
arch=('any')
url="https://github.com/danielkza/Gnome-Shell-Window-Buttons-Extension"
license=('GPL3')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=($_gitname)
conflicts+=($_gitname)
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
depends[gnomeshell]=gnome-shell

package_20_version() {
  local compatibles=($(\
    find -path ./pkg -type d -prune -o \
    -name metadata.json -exec grep -Pzo '(?s)(?<="shell-version": \[)[^\[\]]*(?=\])' '{}' \; | \
    tr '\n," ' '\n' | sed 's/3\.//g;/^$/d' | sort -n -t. -k 1,1))
  depends+=("gnome-shell>=3.${compatibles[0]}")
  local max="${compatibles[-1]}"
  if [ "3.$max" != $(
    gnome-shell --version | grep -Po '(?<=GNOME Shell 3\.)[[:digit:]]+'
  ) ]; then
    depends+=("gnome-shell<3.$((${max%%.*} + 1))")
  fi
  unset depends[gnomeshell]
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
if [ -z "$install" ]
then
  install=gschemas.install
fi

package_10_schemas() {
  msg2 'Installing schemas...'
  find -name '*.xml' -exec install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" '{}' +
}
depends+=(gnome-shell-extensions)

package_03_unify_conveniencejs() {
  ln -fs \
    ../user-theme@gnome-shell-extensions.gcampax.github.com/convenience.js \
    "$destdir/convenience.js"
}

package_09_theme() {
  cp -r --no-preserve=ownership,mode themes "$destdir"
}
