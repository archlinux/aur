# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-noannoyance_v2-git
pkgver=r34.f6e7691
pkgrel=2
pkgdesc="Removes the 'Window is ready' notification and puts the window into focus"
arch=(any)
url="https://github.com/BjoernDaase/noannoyance"
install=${pkgname%-git}.install
license=('GPL2')
depends=('gnome-shell>=3.30')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
}
