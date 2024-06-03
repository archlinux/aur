# Maintainer:
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

_pkgname="gesture-manager"
pkgname="$_pkgname-git"
pkgver=r11.48821e2
pkgrel=2
pkgdesc="Graphical manager for setting libinput-gestures touchpad gestures"
url="https://github.com/gabmus/gestureManager"
license=('GPL-3.0-or-later')
arch=('any')

makedepends=('git')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

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

  install -Dm644 "$_pkgsrc/gesture-manager.desktop.in" "$pkgdir/usr/share/applications/gesture-manager.desktop"

  install -dm755 "$pkgdir/usr/share/$_pkgsrc"
  cp -a "$_pkgsrc"/* "$pkgdir/usr/share/$_pkgsrc/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/gesture-manager" << END
#!/bin/sh
exec /usr/share/gesture-manager/main.py
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
