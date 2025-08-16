# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-forge-git
pkgver=88.r7.g86a04b3
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'less'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/forge-ext/forge.git')
sha256sums=('SKIP')

pkgver() {
  cd forge
  git describe --long --tags --abbrev=7 | sed 's/^v48-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd forge
  make build
}

package() {
  cd forge
  _uuid=$(jq -r .uuid metadata.json)

  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
