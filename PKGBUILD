# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-tilingshell
_uuid=tilingshell@ferrarodomenico.com
pkgver=9.0.0
pkgrel=1
pkgdesc="Extend GNOME Shell with advanced tiling window management."
arch=('any')
url="https://github.com/domferr/tilingshell"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('npm' 'zip')
source=("tilingshell-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1928b7759aa06e25e5bc5f109b3d7ad1cde556da8ca792cdde0bfdc055661bc1')

prepare() {
  cd "tilingshell-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
}

build() {
  cd "tilingshell-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm run build:package
}

package() {
  cd "tilingshell-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 dist/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
