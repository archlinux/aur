# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-auto-accent-color
pkgver=20
pkgrel=1
pkgdesc="GNOME extension to automatically change the desktop accent colour based on the user's wallpaper."
arch=('any')
url="https://codeberg.org/Wartybix/GNOME-Auto-Accent-Colour"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
provides=('gnome-shell-extension-auto-accent-colour')
source=("git+https://codeberg.org/Wartybix/GNOME-Auto-Accent-Colour.git#tag=$pkgver")
sha256sums=('9e25f88d3142de427edefd71212fd891143fab765e51265a3b4180dc62c4e888')

build() {
  cd GNOME-Auto-Accent-Colour
  gnome-extensions pack \
    --extra-source=color-thief/ \
    --extra-source=icons/ \
    --extra-source=cache.js \
    --extra-source=utils.js \
    --force
}

package() {
  cd GNOME-Auto-Accent-Colour
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
