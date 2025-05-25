# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=touche
pkgver=2.0.15
pkgrel=1
_nodeversion=18
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'libadwaita'
  'touchegg'
)
makedepends=(
  'gobject-introspection'
  'meson'
  'nvm'
)
checkdepends=('appstream-glib')
provides=('libtouche.so=0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e9e5eaed3e92bdd341acaeb0c4296f52464e6bb57dc34265c1a689c92e8439de')

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

  # https://archlinux.org/todo/legacy-path-for-metainfo-files/
  sed -i "s/('datadir'), 'appdata')/('datadir'), 'metainfo')/g" data/meson.build
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
