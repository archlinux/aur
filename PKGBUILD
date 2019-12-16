# Maintainer: Luke Street <luke.street@encounterpc.com>

pkgname=gnome-shell-extension-gamemode-git
pkgver=4.r2.ge7cd644
pkgrel=1
pkgdesc="GNOME Shell extension for Feral Interactive's GameMode"
arch=('any')
url='https://github.com/gicmo/gamemode-extension'
license=('GPL2')
makedepends=('meson' 'intltool' 'gamemode')
optdepends=('lib32-gamemode: support for 32-bit applications')
install=gschemas.install

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
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
}

build() {
  cd "$_gitname"
  rm -rf build
  meson build --prefix='/usr'
}

package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}

package_01_ninja_install() {
  cd "$_gitname"
  DESTDIR="$pkgdir" ninja -C build install
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
