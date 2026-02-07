# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-papirus-folders-colorizer
pkgver=3
pkgrel=1
pkgdesc="A GNOME shell extension that automatically syncs your Papirus folder icons with your GNOME Accent Color."
arch=('any')
url="https://github.com/NiffirgkcaJ/papirus-folders-colorizer"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'papirus-folders'
)
makedepends=(
  'git'
  'jq'
)
source=("git+https://github.com/NiffirgkcaJ/papirus-folders-colorizer.git#tag=v$pkgver")
sha256sums=('1019e88e7743db783eddb08455c2f2d96bc16cce421080ae5dc5fdb7c8bcd9e3')

prepare() {
  cd papirus-folders-colorizer

  # GNOME blue > Papirus adwaita
  sed -i "s/blue: 'blue'/blue: 'adwaita'/g" \
    gnome-extensions/extension/shared/constants/constantTheme.js
  
  # GNOME teal > Papirus darkcyan
  sed -i "s/teal: 'teal'/teal: 'darkcyan'/g" \
    gnome-extensions/extension/shared/constants/constantTheme.js
}

build() {
  cd papirus-folders-colorizer
  gnome-extensions pack gnome-extensions/extension \
    --extra-source=shared/ \
    --force
}

package() {
  cd papirus-folders-colorizer
  _uuid=$(jq -r .uuid gnome-extensions/extension/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 gnome-extensions/extension/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
