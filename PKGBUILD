# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-dash-to-dock-animator-git
_pkgname=dash-animator
pkgver=r24.d511de8
pkgrel=1
pkgdesc="Animate the icons of dash to dock"
arch=('any')
url="https://github.com/icedman/dash-animator"
license=('GPL3')
depends=('gnome-shell' 'gnome-shell-extension-dash-to-dock')
makedepends=('intltool' 'git' 'sassc')
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

  make build
  make publish
}

package() {
  cd "${_pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
