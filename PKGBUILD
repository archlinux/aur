# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Radeox <dawid.weglarz95@gmail.com>
pkgname=gnome-shell-extension-forge
pkgver=89
_gnome_ver=49
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
source=("git+https://github.com/forge-ext/forge.git#tag=v${_gnome_ver}-$pkgver")
sha256sums=('ab1d86bb3adb74262c827ea3053efc33ac15634cd8450253237432f1fa539fcd')

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
