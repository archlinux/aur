# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-battery-status-git
_uuid=battery-status@atareao.es
pkgver=4.r25.gf486cb7
pkgrel=2
pkgdesc="Get information about your battery status"
arch=('any')
url="https://github.com/atareao/battery-status"
license=('MIT')
depends=('gnome-shell<=1:44.6')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/atareao/battery-status.git')
sha256sums=('SKIP')

pkgver() {
  cd battery-status
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd battery-status
  gnome-extensions pack \
    --extra-source=icons \
    --extra-source=aboutpage.js \
    --extra-source=dialogwidgets.js \
    --extra-source=piechart.js \
    --extra-source=preferenceswidget.js \
    --force
}

package() {
  cd battery-status
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/es.atareao.battery-status.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
