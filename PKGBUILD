# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-papirus-folders-colorizer
pkgver=5
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
sha256sums=('484f1bf6cbafb36b3c6502601912aa7139324db77d6796877b1a2099ca32caab')

prepare() {
  cd papirus-folders-colorizer

  # GNOME blue > Papirus adwaita
  sed -i "s/blue: 'blue'/blue: 'adwaita'/g" \
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
