# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-auto-accent-color
pkgver=19
pkgrel=1
pkgdesc="GNOME extension to automatically change the desktop accent colour based on the user's wallpaper."
arch=('any')
url="https://github.com/Wartybix/GNOME-Auto-Accent-Colour"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('jq')
provides=('gnome-shell-extension-auto-accent-colour')
source=("GNOME-Auto-Accent-Colour-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('095d9109ebfb740da138141cc4fe4e31b805d66ca76e3d4fff15762ea9aaeca4')

build() {
  cd "GNOME-Auto-Accent-Colour-$pkgver"
  gnome-extensions pack \
    --extra-source=color-thief/ \
    --extra-source=icons/ \
    --extra-source=utils.js \
    --extra-source=cache.js \
    --force
}

package() {
  cd "GNOME-Auto-Accent-Colour-$pkgver"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
