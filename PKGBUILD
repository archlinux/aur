# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=gnome-shell-extension-panel-corners
pkgver=16
pkgrel=1
pkgdesc="A gnome-shell extension to keep the old topbar corners, which were removed for GNOME 42"
arch=('any')
url="https://github.com/aunetx/panel-corners"
license=('GPL-3.0-or later')
depends=('gnome-shell')
makedepends=(
  'jq'
  'zip'
)
source=("panel-corners-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ce9964265fc27927263b636bb8a1439c160bf3512f08146e3a71922db30d519')

build() {
  cd "panel-corners-$pkgver"
  make build
}

package() {
  cd "panel-corners-$pkgver"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "build/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
