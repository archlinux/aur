# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Contributer: Eric Cheng <eric at chengeric dot com>
pkgname=gnome-shell-extension-alphabetical-grid-extension
pkgver=43.0
pkgrel=1
pkgdesc="Alphabetically order GNOME's app grid and folders"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('jq')
source=("alphabetical-grid-extension-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0fe9d76752d5afc5a847c7ded38cc18399907e93f3ecf8e74a89458b13e79381')

build() {
  cd "alphabetical-grid-extension-$pkgver"
  make build
}

package() {
  cd "alphabetical-grid-extension-$pkgver"
  _uuid=$(jq -r .uuid extension/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 extension/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/LICENCE.txt"
}
