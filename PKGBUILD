# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-bluetooth-quick-connect
_uuid=bluetooth-quick-connect@bjarosze.gmail.com
pkgver=46
pkgrel=1
pkgdesc="Allow to connect Bluetooth paired devices from GNOME control panel."
arch=('any')
url="https://github.com/Extensions-Valhalla/gnome-bluetooth-quick-connect"
license=('GPL-3.0-or-later')
depends=('gnome-shell' 'bluez-utils')
makedepends=('git' 'pnpm')
_commit=66ff5ee109a1d753436799e44a32a577c22e5aef  #  tags/v46^0
source=("git+https://github.com/Extensions-Valhalla/gnome-bluetooth-quick-connect.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd gnome-bluetooth-quick-connect
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd gnome-bluetooth-quick-connect
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm i
  pnpm build
}

package() {
  cd gnome-bluetooth-quick-connect
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "dist/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 dist/schemas/org.gnome.shell.extensions.bluetooth-quick-connect.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  # Extension expects schema to be in extension directory
#  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
