# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-burn-my-windows-git
_pkgname=Burn-My-Windows
pkgver=r19.570a014
pkgrel=1
pkgdesc="Disintegrate your apps the old-school way."
arch=('any')
url="https://github.com/Schneegans/Burn-My-Windows"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  make zip
}

package() {
  cd "$_pkgname"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
