# Maintainer: XZS <d dot f dot fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-stealmyfocus-git
pkgver=6
pkgrel=1
pkgdesc="Shell Extension that let window that demand attention to steal focus"
arch=(any)
license=(GPLv2)
replaces=('gnome-shell-extension-justshowthewindow')
url="https://github.com/v-dimitrov/gnome-shell-extension-stealmyfocus"
install=notice.install

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

pkgver() {
  cd ${_gitname:-$pkgname}
  sed -n 's/.*"version"\s*:\s*\([[:digit:].]*\).*/\1/p' \
    metadata.json | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
depends[125]=gnome-shell

readonly prefixes=(3. 1:3. 1:)
prefix() {
  echo "${prefixes[(( ("$1" > 30) + ("$1" >= 40) ))]}"
}

package_20_version() {
  local compatibles=($(\
    find -path ./pkg -type d -prune -o \
    -name metadata.json -exec cat '{}' \; | \
    tr -d '\n' | grep -Po '(?<="shell-version": \[)[^\[\]]*(?=\])' | \
    tr '\n," ' '\n' | sed 's/3\.//g;/^$/d' | sort -n -t. -k 1,1))
  local min="${compatibles[0]}"
  depends+=("gnome-shell>=$(prefix "${min%%.*}")$min")
  if [ "${compatibles[-1]}" != $(
    LD_PRELOAD= gnome-shell --version | \
      sed -n 's/^GNOME Shell \(3\.\)\?\([[:digit:]]\+\).*$/\2/p'
  ) ]; then
    let max=${compatibles[-1]%%.*}+1
    depends+=("gnome-shell<$(prefix "$max")$max")
  fi
  unset depends[125]
}
package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}
package_01_locate() {
  msg2 'Locating extension...'
  cd "$(find -name 'metadata.json' -execdir test -e extension.js \; \
    -printf '%C@ %h\n' | sort -nr | sed 's/^.* //;q' )"
  extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$extname"
}

package_02_install() {
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) \
    -exec install -Dm644 -t "$destdir" '{}' +
}
