# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-pip-on-top-git
pkgver=r20.cd80aa2
pkgrel=1
pkgdesc="Makes "Picture-in-Picture" windows stay on top (even on Wayland session). Compatible with Firefox and Clapper media player."
arch=('any')
url="https://github.com/Rafostar/gnome-shell-extension-pip-on-top"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
optdepends=('clapper')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"

  ./translate.sh
}

build() {
  cd "${pkgname%-git}"

  ./bundle.sh
}

package() {
  cd "${pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar --uid 0 --gid 0 -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
