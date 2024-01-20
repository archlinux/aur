# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-rounded-window-corners-git
pkgver=11.r38.g3f00988
pkgrel=1
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'gobject-introspection' 'yarn' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/yilozt/rounded-window-corners.git')
sha256sums=('SKIP')

pkgver() {
  cd rounded-window-corners
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rounded-window-corners
}

build() {
  cd rounded-window-corners
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
  yarn build
  yarn ext:pack
}

package() {
  cd rounded-window-corners
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "${uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 _build/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"
}
