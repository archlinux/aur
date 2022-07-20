# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-big-avatar-git
_pkgname=Big-Avatar-Gnome-Shell-Extension
pkgver=r75.1c5b7bc
pkgrel=1
pkgdesc="An extension based on https://github.com/db0x/bigavatar-db0x.de, it adds your avatar icon and name to the menu panel. It allows you to tweak the size of both font and avatar image"
arch=('any')
url="https://github.com/GustavoPeredo/Big-Avatar-Gnome-Shell-Extension"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname%-git}"
  glib-compile-schemas schemas
  gnome-extensions pack \
            --force \
            --extra-source="assets" \
            --extra-source="schema" \
            --extra-source="LICENSE" \
            --extra-source="README.md"
}

package() {
	cd "${_pkgname%-git}"
  
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
