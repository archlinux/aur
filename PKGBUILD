# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-rounded-window-corners-git
_pkgname=rounded-window-corners
pkgver=r62.59b903b
pkgrel=1
pkgdesc="A gnome-shell extensions that try to add rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'yarn' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname%-git}"

  yarn install
  yarn build
}

package() {
  cd "${_pkgname%-git}"/_build
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
