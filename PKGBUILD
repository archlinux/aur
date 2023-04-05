# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
_app_id=com.vysp3r.ProtonPlus
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple Wine and Proton-based compatiblity tools manager for GNOME"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('491439d0fda50e824dafd644c3ba95a51a50972194c06df7915784b17ad50e17')

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
