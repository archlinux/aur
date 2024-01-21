# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=monitorets
pkgver=0.10.1
pkgrel=1
pkgdesc="Have always at a glance the usage of system resources"
arch=('any')
url="https://github.com/jorchube/monitorets"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-cairo' 'python-gobject' 'python-psutil'
         'python-xdg-base-dirs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1592d8c1bded965dd7564fe5da3084dbb1a818ca4d9cfbd08885d7306cc54eb6')

prepare() {
  cd "$pkgname-$pkgver"

  # xdg is now xdg_base_dirs
  sed -i 's/from xdg import/from xdg_base_dirs import/g' src/preferences.py

  # correct version
  sed -i "s/0.10.0/$pkgver/g" src/main.py
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
