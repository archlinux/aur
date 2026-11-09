# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-bluetooth-quick-connect
pkgver=56
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
  'nodejs'
  'pnpm'
  'zip'
)
source=("gnome-bluetooth-quick-connect-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7136d78fb4a4a5b76676243528473fe5189e1ff6265a19138a400ffb02b2c881')

prepare() {
  cd gnome-bluetooth-quick-connect-$pkgver
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile
}

build() {
  cd gnome-bluetooth-quick-connect-$pkgver
  export PNPM_HOME="$srcdir/pnpm-home"
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
