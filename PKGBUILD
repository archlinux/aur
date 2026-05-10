# Maintainer: Mark wagie <mark dot wagie at proton dot me>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
pkgname=gnome-shell-extension-gtile
pkgver=70
pkgrel=1
_nodeversion=24
pkgdesc="A window tiling extension for GNOME Shell"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'nvm'
)
source=("https://github.com/gTile/gTile/archive/V$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('edacbab6ea69d18811a564fd63865b36fcf58a35daec3c73ec3ff4894f14ffa7')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd gTile-$pkgver
  _ensure_local_nvm
  nvm install "${_nodeversion}"
}

build() {
  cd gTile-$pkgver
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm install
  npm run build:dist
}

package() {
  cd gTile-$pkgver
  _uuid=$(jq -r .uuid dist/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf gtile.dist.tgz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 dist/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
