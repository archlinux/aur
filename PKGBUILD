# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-bluetooth-quick-connect
pkgver=54
pkgrel=1
pkgdesc="Allow to connect Bluetooth paired devices from GNOME control panel."
arch=('any')
url="https://github.com/Extensions-Valhalla/gnome-bluetooth-quick-connect"
license=('GPL-3.0-or-later')
depends=(
  'bluez-utils'
  'gnome-shell'
)
makedepends=(
  'jq'
  'pnpm'
  'zip'
)
source=("gnome-bluetooth-quick-connect-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6642981c00bf362d7de0d46fe1d65d4216cd2c34d098229d7443bb8c6eb9370a')

build() {
  cd gnome-bluetooth-quick-connect-$pkgver
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install
  pnpm build
}

package() {
  cd gnome-bluetooth-quick-connect-$pkgver
  _uuid=$(jq -r .uuid assets/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "dist/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 dist/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
