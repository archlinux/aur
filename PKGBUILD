# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co Maintainer: harshadgavali <harshadgavali5022 at gmail dot com>
pkgname=gnome-gesture-improvements
pkgver=r193.b037379
pkgrel=1
pkgdesc="Touchpad gesture improvements for GNOME on Wayland/X11"
arch=('any')
url="https://github.com/harshadgavali/gnome-gesture-improvements"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'npm' 'zip')
optdepends=('gnome-x11-gesture-daemon: Required for Xorg session')
_commit=b0373790d18ecd129a12191bdc95e8211ad03971
source=("git+https://github.com/harshadgavali/gnome-gesture-improvements.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run pack
}

package() {
  cd "$srcdir/$pkgname"
  _uuid='gestureImprovements@gestures'
  _schema='org.gnome.shell.extensions.gestureImprovements.gschema.xml'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"
  bsdtar xvf "build/$_uuid.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 "build/extension/schemas/$_schema" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
