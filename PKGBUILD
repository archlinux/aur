# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-adwaita-colors-home
pkgver=4
pkgrel=1
pkgdesc="Official companion extension for the Adwaita Colors icon theme."
arch=('any')
url="https://github.com/dpejoh/Adwaita-Colors-Home"
license=('GPL-3.0-or-later')
depends=(
  'adwaita-colors-icon-theme'
  'gnome-shell'
)
makedepends=(
  'git'
  'jq'
)
source=("git+https://github.com/dpejoh/Adwaita-Colors-Home.git#tag=v$pkgver")
sha256sums=('3de78fc8f63a493cd9fb3dc002ceffc2b3bf41c47d79088bccf86bf64f661ca4')

build() {
  cd Adwaita-Colors-Home
  gnome-extensions pack --force
}

package() {
  cd Adwaita-Colors-Home
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
