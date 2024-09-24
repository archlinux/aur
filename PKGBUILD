# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-bluetooth-quick-connect
_uuid=bluetooth-quick-connect@bjarosze.gmail.com
pkgver=51
pkgrel=1
pkgdesc="Allow to connect Bluetooth paired devices from GNOME control panel."
arch=('any')
url="https://github.com/Extensions-Valhalla/gnome-bluetooth-quick-connect"
license=('GPL-3.0-or-later')
depends=('bluez-utils' 'gnome-shell')
makedepends=('pnpm' 'zip')
source=("gnome-bluetooth-quick-connect-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56495812d08a3d20d4cd896c2e0f8e47cb4575bf6b85e84040be1d1684f0ab51')

build() {
  cd gnome-bluetooth-quick-connect-$pkgver
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install
  pnpm build
}

package() {
  cd gnome-bluetooth-quick-connect-$pkgver
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "dist/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 dist/schemas/org.gnome.shell.extensions.bluetooth-quick-connect.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
