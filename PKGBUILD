# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=eloquent
pkgver=1.1
pkgrel=1
pkgdesc="Your proofreading assistant"
arch=(any)
url="https://github.com/sonnyp/Eloquent"
license=(GPL-3.0-only)
depends=(gjs libadwaita languagetool)
makedepends=(gobject-introspection blueprint-compiler git meson)
checkdepends=(appstream-glib)
install=eloquent.install
source=(
  "git+https://github.com/sonnyp/Eloquent.git#tag=v$pkgver"
  "git+https://github.com/sonnyp/troll.git#commit=53155a0" # submodule commit for this tag so far
)
b2sums=(
  '72f0288cad0878590e6015f0e8c14cfc0f841b570d042501bd48d5f284aafbc05a97ad8c2a7618c40d7fa348fa1de20a5407fbe5661114b6138088aae711d717'
  '4321bc52b2fa758a55e8f49bd14b58b1ba13b2f67f7dcdfec453e5b8ae6fc946fb61b3efe3790e3c7531b056116a1118d22d360e0a04fb90b0017fce58457d84'
)

prepare() {
  cd Eloquent
  git submodule init
  git config submodule.troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson Eloquent build
  meson compile -C build
}

# https://github.com/sonnyp/Eloquent/issues/13
check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
