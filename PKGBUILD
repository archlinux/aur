# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-rounded-window-corners-git
pkgver=4.r33.ge76dc9a
pkgrel=1
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'gobject-introspection' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/yilozt/rounded-window-corners.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rounded-window-corners"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/rounded-window-corners"
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
  cd "$srcdir/rounded-window-corners"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "_build/${uuid}.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"

  install -Dm644 _build/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"
}
