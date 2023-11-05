# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/gestureManager

_pkgname="gesture-manager"
pkgname="$_pkgname-git"
pkgver=r11.48821e2
pkgrel=1
pkgdesc='Graphical manager for setting libinput-gestures touchpad gestures'
url='https://github.com/gabmus/gestureManager'
license=('GPL3')
arch=('any')

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  :
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    set -o pipefail

    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' \
    || printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
fi

package() {
  depends+=(
    'gobject-introspection-runtime'
    'gtk3'
    'libinput-gestures'
    'perl'
    'python'
    'python-gobject'
    'xf86-input-libinput'
  )

  mkdir -p "${pkgdir:?}/usr/share"/{applications,$_pkgsrc}
  mkdir -p "${pkgdir:?}/usr/bin"

  cp "$_pkgsrc/gesture-manager.desktop.in" "${pkgdir:?}/usr/share/applications/gesture-manager.desktop"

  cp -r "$_pkgsrc"/* "${pkgdir:?}/usr/share/$_pkgsrc/"

  echo -e "#\!/bin/sh\nexec /usr/share/gesture-manager/main.py" > "${pkgdir:?}/usr/bin/gesture-manager"

  chmod +x "${pkgdir:?}/usr/bin/gesture-manager"
}
