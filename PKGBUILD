# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-tilingshell
_uuid=tilingshell@ferrarodomenico.com
pkgver=16.0
pkgrel=1
_nodeversion=20
pkgdesc="Extend GNOME Shell with advanced tiling window management."
arch=('any')
url="https://github.com/domferr/tilingshell"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('nvm' 'zip')
source=("tilingshell-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('85460bedc1799fd3ad3f6e55c6520ed03385f3a6ad68f4cf048c663ba5d98c22')

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
  cd "tilingshell-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  npm install
}

build() {
  cd "tilingshell-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm run build:package
}

package() {
  cd "tilingshell-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 dist/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
