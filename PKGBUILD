pkgname=sway
pkgver=0.15.2
pkgrel=3
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=('x86_64')
url='https://swaywm.org/'
license=('MIT')
depends=('gdk-pixbuf2' 'pango' 'wlc' 'xorg-server-xwayland')
makedepends=('asciidoc' 'cmake' 'ninja')
optdepends=(
  'dmenu: Default for launching applications.'
  'ffmpeg: For recording screencasts.'
  'i3status: To display system information with a bar.'
  'imagemagick: For taking screenshots.'
  'rxvt-unicode: Default terminal emulator.'
)
validpgpkeys=('9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/$pkgname/archive/$pkgver.tar.gz"
  "https://github.com/swaywm/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=('05526e3038d2a5490a64bd816f1f04d2a6c214ddc6182835312b273b40b737ae'
            'SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVERSION="$pkgver" \
    -DCMAKE_C_FLAGS='-w' \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: sw=2 ts=2 et:
