# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=conjure
_app_id=io.github.nate_xyz.Conjure
pkgver=0.1.2
pkgrel=1
pkgdesc="Magically transform your images."
arch=('any')
url="https://github.com/nate-xyz/conjure"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'python-loguru' 'python-wand')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
_commit=bdbea03359109be6ebe0bea9fa5678c4ce541987  # tags/v0.1.2^0
source=("git+https://github.com/nate-xyz/conjure.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$pkgname"
  sed -i "s/Exec=$pkgname/Exec=$_app_id/g" "data/$_app_id.desktop.in"
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Conflicts with imagmagick 'conjure' binary
  mv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$_app_id"
}
