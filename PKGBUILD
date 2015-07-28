# Maintainer: XZS <d dot f dot fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname='gnome-shell-extension-justshowthewindow-git'
pkgdesc="Rather than the default gnome-shell behaviour of showing a notification that a window is ready, the window is just displayed"
pkgver=r2.275595c
pkgrel=1
arch=(any)
depends=('gnome-shell>=3.6')
license=(GPLv2)
url="https://github.com/ryanlerch/gnome-shell-extension-justshowthewindow"
install=notice.install

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
prepare() {
  # adjust for shell versions that are not officially supported.
  local min=$(echo ${depends[@]} | grep -Po '(?<=gnome-shell>=3\.)[[:digit:]]+')
  local max=$(echo ${depends[@]} | grep -Po '(?<=gnome-shell<3\.)[[:digit:]]+')
  if [ -z "$max" ]
  then max=$(
    gnome-shell --version | grep -Po '(?<=GNOME Shell 3\.)[[:digit:]]+'
  ); fi
  find -name 'metadata.json' -exec sed -i 'H;1h;$!d;x;
    s/"shell-version": \[.*\]/"shell-version": [ '"$(seq -s ', ' -f '"3.%g"' $min 2 $max)"' ]/' \
    '{}' +
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
