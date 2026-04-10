# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-tilingshell
pkgver=17.3
pkgrel=2
_nodeversion=24
pkgdesc="Extend GNOME Shell with advanced tiling window management."
arch=('any')
url="https://github.com/domferr/tilingshell"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'nvm'
  'zip'
)
source=("git+https://github.com/domferr/tilingshell.git#tag=$pkgver")
sha256sums=('9c307b719aafbbf4a6e8c1424584162505e1a9a9395306cf92d97e6ac1859e38')

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
  cd tilingshell

  # add GNOME 50 support and update packages
  git cherry-pick -n e7e40e76d25f7deceacb3327f1c91c25b1a5e981

  # fix: restore Super key activation for tiling mode
  # https://github.com/domferr/tilingshell/pull/506
  git cherry-pick -n b44528cce32b0749e1b9abb53604bc26613b85f3

  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  npm install
}

build() {
  cd tilingshell
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm run build:package
}

package() {
  cd tilingshell
  _uuid=$(jq -r .uuid resources/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 dist/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
