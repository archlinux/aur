# Maintainer: revelation60 <benruyl@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=gnome-shell-extension-gtile-git
_uuid=gTile@vibou
pkgver=53.r0.g138a98c
pkgrel=1
pkgdesc="A window tiling extension for GNOME"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gTile/gTile.git')
sha256sums=('SKIP')

pkgver() {
  cd gTile
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gTile
}

build() {
  cd gTile
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run build
  npm run build:dist
}

package() {
  cd gTile
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf gtile.dist.tgz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 dist/schemas/org.gnome.shell.extensions.gtile.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
