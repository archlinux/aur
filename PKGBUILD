# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
pkgver=75
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:45')
makedepends=('git' 'glib2' 'npm' 'meson')
checkdepends=('reuse' 'eslint')
source=($pkgname::git+$url.git#tag=$pkgver)
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd $pkgname
  export npm_config_cache="$srcdir/npm_cache"
  npm install

  arch-meson . build
  meson compile -C build
}

check() {
  cd $pkgname
  meson test -C build --print-errorlogs || :
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
}
