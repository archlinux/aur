pkgname=gnome-shell-extension-tilingshell
_uuid=tilingshell@ferrarodomenico.com
pkgver=8.0.0
pkgrel=1
pkgdesc="Extend GNOME Shell with advanced tiling window management."
arch=('any')
url="https://github.com/domferr/tilingshell"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('npm' 'zip')
source=("tilingshell-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b49b4efe44d07652a549c8aaaa70a69b33d82187bf422cb96f7dee3d62ee7ab6')

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
