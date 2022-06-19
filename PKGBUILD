# Maintainer: Justin Chadwell <me@jedevc.com>

pkgname=gnome-shell-extension-reorder-workspaces-git
_pkgname=gnome-reorder-workspaces
pkgver=11.r0.gfd8628a
pkgrel=1
pkgdesc="Move workspaces up or down in the GNOME overview"
arch=('any')
url="https://github.com/jeremiahmegel/gnome-reorder-workspaces"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('git' 'unzip' 'yarn')
provides=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  yarn install
  yarn build
}

package() {
  cd "$_pkgname"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' package.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  unzip -X "dist/${uuid}.shell-extension.zip" -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
