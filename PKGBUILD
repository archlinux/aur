# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-rounded-window-corners
pkgver=11
pkgrel=5
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL-3.0-or-later')
depends=('gnome-shell<=1:44.6')
makedepends=('gobject-introspection' 'yarn' 'zip')
source=("rounded-window-corners-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('452bbe5a3ef4e9211b1a73f9ec8ded5a34611398bdbc7a85062d0b3d92181e9a')

build() {
  cd "rounded-window-corners-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
  yarn build
  yarn ext:pack
}

package() {
  cd "rounded-window-corners-$pkgver"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "${uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 _build/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"
}
