# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=echo
_app_id=io.github.lo2dev.Echo
pkgver=3
pkgrel=2
pkgdesc="Utility to ping websites."
arch=('any')
url="https://lo2dev.github.io/portal/echo"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-icmplib'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Echo-$pkgver.tar.gz::https://github.com/lo2dev/Echo/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d4730771bae69471b4e02047f5599fb4cb595de4563b3208292acc0de205d437')

build() {
  arch-meson "Echo-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # conflicts with coreutils
  mv -v "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/Echo"
  desktop-file-edit --set-key=Exec --set-value=/usr/bin/Echo \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
}
