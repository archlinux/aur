# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-rounded-window-corners-git
pkgver=11.r12.gce88738
pkgrel=2
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL3')
depends=('gnome-shell<=1:44.6' 'libadwaita')
makedepends=('git' 'gobject-introspection' 'yarn' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/yilozt/rounded-window-corners.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rounded-window-corners"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/rounded-window-corners"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
  yarn build
  yarn ext:pack
}

package() {
  cd "$srcdir/rounded-window-corners"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "${uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 _build/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"
}
