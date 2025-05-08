# Maintainer:
# Contributor: Mingi Sung <dawdleming@gmail.com>

: ${_pkgtype=-git}

_pkgname="libinput-gestures"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.80.r0.g9ff9381
pkgrel=1
pkgdesc="Actions gestures on your touchpad using libinput"
url="https://github.com/bulletmark/libinput-gestures"
license=("GPL-3.0-or-later")
arch=("any")

depends=(
  'libinput'
  'python'
  'python-dbus'
  'python-gobject'
)
makedepends=(
  'git'
)
optdepends=(
  'wmctrl: required for _internal command, as per default configuration'
  'xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

backup=("etc/${_pkgname}.conf")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  local _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
  [ -z "$_pkgtype" ] && git -c advice.detachedHead=false checkout -f "${_tag:?}"
  git describe --tags --long

  # change icon path
  sed -E -e 's&^(ICOBAS)=.*$&\1="/usr/share/pixmaps"&' \
    -e 's&^(ICODIR)=.*$&\1="$ICOBAS"&' \
    -i "libinput-gestures-setup"
}

pkgver() {
  cd "$_pkgsrc"
  if [ -z "$_pkgtype" ]; then
    git describe --tags
  else
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*'
  fi | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir/" install
}
