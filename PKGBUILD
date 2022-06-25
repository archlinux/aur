# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-shell-configurator-git
_pkgname=shell-configurator
pkgver=r195.37713b7
pkgrel=1
pkgdesc="Configure and customize GNOME Shell with advanced settings."
arch=('any')
url="https://gitlab.com/adeswantaTechs/shell-configurator"
license=('GPL3')
depends=('gnome-shell-extensions')
makedepends=('zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  ./installer.sh --build
}

package() {
  cd "$_pkgname"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' src/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
