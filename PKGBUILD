# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-rounded-window-corners
_pkgname=rounded-window-corners
pkgver=4
pkgrel=1
pkgdesc="A gnome-shell extensions that try to add rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL3')
depends=('gnome-shell')
makedepends=('yarn' 'zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('b9bd983066c4129c39709a97f8bb5a3ae854c1a3cc6252c14fbbb2e3fd4db97e4cca5c5e6840df7095d31f01cf22f2fc406d83db1b8b311ab15d09478a5e1a3a')

build() {
  cd "${_pkgname%-git}-$pkgver"

  yarn install
  yarn build
}

package() {
  cd "${_pkgname%-git}-$pkgver"/_build
  glib-compile-schemas schemas
  gnome-extensions pack \
            --force \
            --extra-source="dbus" \
            --extra-source="effect" \
            --extra-source="manager" \
            --extra-source="preferences" \
            --extra-source="schemas" \
            --extra-source="utils"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
