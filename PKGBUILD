# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Radeox <dawid.weglarz95@gmail.com>
pkgname=gnome-shell-extension-forge
pkgver=88
_gnome_ver=48
pkgrel=2
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
source=("git+https://github.com/forge-ext/forge.git#tag=v${_gnome_ver}-$pkgver")
sha256sums=('a1d0f561d6f7fe5b0eb3995fa4f942355081b063b20ec53b235040340a2a7375')

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
