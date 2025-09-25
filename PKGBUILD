# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-tilingshell
pkgver=16.4
pkgrel=2
_nodeversion=22
pkgdesc="Extend GNOME Shell with advanced tiling window management."
arch=('any')
url="https://github.com/domferr/tilingshell"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=(
  'jq'
  'nvm'
  'zip'
)
source=("tilingshell-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "gnome49.patch")
sha256sums=('93f0649b4a274cd6553d483dd09d16ab9753ff3d67d3c44d085ba8ebc7af24ae'
            '94fc916657165b9cf9ec952353d732f86f377ed1a6aee1b2371e18abb154e919')

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

  # GNOME 49
  # https://github.com/domferr/tilingshell/issues/402
  # https://github.com/domferr/tilingshell/pull/404
  patch -Np1 -i ../gnome49.patch
}

build() {
  cd "tilingshell-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm run build:package
}

package() {
  cd "tilingshell-$pkgver"
  _uuid=$(jq -r .uuid resources/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 dist/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
