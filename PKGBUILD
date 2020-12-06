# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
_pkgname=razergenie
pkgname=razergenie-git
pkgver=0.7.r111.g312a836
pkgrel=1
pkgdesc="Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'openrazer-daemon')
makedepends=('git' 'meson' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/RazerGenie.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_upstream
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson --wrap-mode=default "$_upstream" build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Manually install libopenrazer here for now
  install -Dm755 build/subprojects/libopenrazer/libopenrazer.so.0.0.1 \
    "$pkgdir"/usr/lib/libopenrazer.so.0.0.1
  ln -s libopenrazer.so.0.0.1 "$pkgdir"/usr/lib/libopenrazer.so.0
  ln -s libopenrazer.so.0 "$pkgdir"/usr/lib/libopenrazer.so
}
