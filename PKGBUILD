# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Contributer: Eric Cheng <eric at chengeric dot com>
pkgname=gnome-shell-extension-alphabetical-grid-extension
pkgver=44.0
pkgrel=1
pkgdesc="Alphabetically order GNOME's app grid and folders"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('jq')
source=("alphabetical-grid-extension-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5dbb7f09921426a74fdf0834c72e44e89f1fb60cc364f25deda835c55bcb2639')

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
