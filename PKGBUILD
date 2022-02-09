# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-frequency-boost-switch-git
_pkgname=gnome-frequency-boost-switch
pkgver=r5.2bce622
pkgrel=1
pkgdesc="Add a toggle to enable/disable CPU frequency boost in Gnome Power Profiles menu."
arch=('any')
url="https://gitlab.com/metal03326/gnome-frequency-boost-switch"
license=('GPL3')
depends=('gnome-shell>=1.41')
makedepends=('git' 'zip')
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

  make build
}

package() {
  cd "$_pkgname"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' src/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
