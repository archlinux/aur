# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co Maintainer: harshadgavali <harshadgavali5022 at gmail dot com>
pkgname=gnome-gesture-improvements
pkgver=r201.f007cac
pkgrel=2
pkgdesc="Touchpad gesture improvements for GNOME on Wayland/X11"
arch=('any')
url="https://github.com/harshadgavali/gnome-gesture-improvements"
license=('GPL-3.0-or-later')
depends=('gnome-shell<=1:44.6')
makedepends=('git' 'npm' 'zip')
optdepends=('gnome-x11-gesture-daemon: Required for Xorg session')
_commit=f007cac312dc52144760177c35ba18e8a1029056  # version: 25.0
source=("git+https://github.com/harshadgavali/gnome-gesture-improvements.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run pack
}

package() {
  cd "$pkgname"
  _uuid='gestureImprovements@gestures'
  _schema='org.gnome.shell.extensions.gestureImprovements.gschema.xml'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"
  bsdtar xvf "build/$_uuid.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/" --no-same-owner

  install -Dm644 "build/extension/schemas/$_schema" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
