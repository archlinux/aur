# Maintainer: Mark wagie <mark dot wagie at proton dot me>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
pkgname=gnome-shell-extension-gtile
_uuid=gTile@vibou
pkgver=64
pkgrel=2
_nodeversion=22
pkgdesc="A window tiling extension for GNOME Shell"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'nvm')
source=("https://github.com/gTile/gTile/archive/V$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c203b973e784af9df7d299a280b313ea6914e2145dbcd7664b5d9b630a694757')

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
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf gtile.dist.tgz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 dist/schemas/org.gnome.shell.extensions.gtile.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
