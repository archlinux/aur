# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Mantas Mikulėnas <grawity at gmail dot com>
# Contributor: Morris Jobke <hey at morrisjobke dot de>
# Contributor: alucryd <alucryd at gmail dot com>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-mediaplayer-git
pkgver=4.0
pkgrel=1
pkgdesc='A mediaplayer indicator for the Gnome Shell'
arch=('any')
url='https://github.com/JasonLG1979/gnome-shell-extensions-mediaplayer'
license=('GPL2')
makedepends=('meson' 'intltool')
optdepends=('mpdris2: MPD support')
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
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  git tag -d 3,4
  sed -i "
    /^if/s/not//
    /DATA_DIR =/s/$/[1:]/
    /^EXTENSION_DIR =/s/path\\.join(/&DEST_DIR,/
  " meson_post_install.py
}

build() {
  cd "$_gitname"
  rm -rf builddir
  meson builddir --prefix='/usr'
}

package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}

package_01_ninja_install() {
  cd "$_gitname"
  DESTDIR="$pkgdir" ninja -C builddir install
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
