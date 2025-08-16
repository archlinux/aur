# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: revelation60 <benruyl@gmail.com>
pkgname=gnome-shell-extension-gtile-git
pkgver=64.r2.g09d81a1
pkgrel=1
_nodeversion=22
pkgdesc="A window tiling extension for GNOME"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'nvm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gTile/gTile.git')
sha256sums=('SKIP')

pkgver() {
  cd gTile
  git describe --long --tags --abbrev=7 | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  cd gTile
  _ensure_local_nvm
  nvm install "${_nodeversion}"
}

build() {
  cd gTile
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run build:dist
}

package() {
  cd gTile
  _uuid=$(jq -r .uuid dist/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf gtile.dist.tgz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 dist/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
