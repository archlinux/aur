# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=touche
pkgver=2.0.11
pkgrel=1
_nodeversion=18
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL-3.0-or-later')
depends=('gjs' 'libadwaita' 'touchegg')
makedepends=('gobject-introspection' 'meson' 'nvm')
checkdepends=('appstream-glib')
provides=('libtouche.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8ad5112267c3546dfd59ba6d604b8b66fd141926ebde4c8946a79932adac907c')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "$pkgname-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
}

build() {
  cd "$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm install

  arch-meson . build
  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/com.github.joseexposito.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
