# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-quick-settings-tweaks-git
_pkgname=quick-settings-tweaks
pkgver=r27.3956727
pkgrel=1
pkgdesc="Let's tweak gnome 43's quick settings! You can add Media Control, Notification, Volume Mixer on quick settings and remove unuseful buttons!"
arch=('any')
url="https://github.com/qwreey75/quick-settings-tweaks"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
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

  ./build.sh
}

package() {
  cd "${_pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar --uid 0 --gid 0 -xvf dist/output.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
