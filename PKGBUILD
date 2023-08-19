# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-battery-status-git
_uuid=battery-status@atareao.es
pkgver=4.r25.gf486cb7
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
  gnome-extensions pack \
    --extra-source=icons \
    --extra-source=aboutpage.js \
    --extra-source=dialogwidgets.js \
    --extra-source=piechart.js \
    --extra-source=preferenceswidget.js \
    --force
}

package() {
  cd "$srcdir/battery-status"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf "$_uuid.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/es.atareao.battery-status.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
