# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-rounded-window-corners
pkgver=5
pkgrel=1
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL3')
depends=('gnome-shell')
makedepends=('gobject-introspection' 'yarn')
source=("rounded-window-corners-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('d983b9125fc653fc4c0f979e9252843411b6139af4060ab262287216ca6f0be0')

build() {
  cd "rounded-window-corners-$pkgver"
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn build

  pushd _build
  gnome-extensions pack \
            --extra-source=dbus/ \
            --extra-source=effect/ \
            --extra-source=manager/ \
            --extra-source=preferences/ \
            --extra-source=utils/ \
            --extra-source=app.js \
            --extra-source=stylesheet-prefs.css \
            --force
  popd
}

package() {
  cd "rounded-window-corners-$pkgver"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "_build/${uuid}.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"

  install -Dm644 _build/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"
}
