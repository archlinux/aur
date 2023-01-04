# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
_app_id=com.vysp3r.ProtonPlus
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple proton version manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0511b4a24bc8147ab2847dc33f5d6b2861c19ff015ceeed213eee226a9ef0a72')

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build

  cd "ProtonPlus-$pkgver"
  appstream-util validate-relax --nonet "data/${_app_id}.appdata.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
