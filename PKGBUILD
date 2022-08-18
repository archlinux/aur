# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-battery-status-git
pkgver=4.r23.g15be81a
pkgrel=1
pkgdesc="Get information about your battery status"
arch=('any')
url="https://github.com/atareao/battery-status"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/atareao/battery-status.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/battery-status"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/battery-status"
  gnome-extensions pack --force \
    --extra-source=aboutpage.js \
    --extra-source=convenience.js \
    --extra-source=dialogwidgets.js \
    --extra-source=piechart.js \
    --extra-source=preferenceswidget.js \
    --extra-source=icons
}

package() {
  cd "$srcdir/battery-status"
  _uuid='battery-status@atareao.es'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf "$_uuid.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"
  install -Dm644 schemas/es.atareao.battery-status.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
