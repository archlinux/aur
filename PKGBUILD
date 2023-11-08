# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-bluetooth-quick-connect
_uuid=bluetooth-quick-connect@bjarosze.gmail.com
pkgver=r120.c40735e
pkgrel=1
pkgdesc="Allow to connect Bluetooth paired devices from GNOME control panel."
arch=('any')
url="https://github.com/Extensions-Valhalla/gnome-bluetooth-quick-connect"
license=('GPL3')
depends=('gnome-shell' 'bluez-utils')
makedepends=('git' 'pnpm')
_commit=c40735e0ad35de68568c97396c1eeaf102b65004  #  tags/gnome-45^0
source=("git+https://github.com/Extensions-Valhalla/gnome-bluetooth-quick-connect.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd gnome-bluetooth-quick-connect
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gnome-bluetooth-quick-connect
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm i
  pnpm extension:build
}

package() {
  cd gnome-bluetooth-quick-connect
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/org.gnome.shell.extensions.bluetooth-quick-connect.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  # Extension expects schema to be in extension directory
#  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
