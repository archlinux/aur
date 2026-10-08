# Maintainer: maxDTM <265972625+maxDTM at users dot noreply dot github dot com>
pkgname=slatekbd
pkgver=0.1.0
pkgrel=1
pkgdesc='On-screen keyboard for Wayland compositors (layer-shell, input-method-v2, virtual-keyboard)'
arch=('x86_64' 'aarch64')
url='https://github.com/maxDTM/slatekbd'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'cairo' 'pango' 'glib2' 'glibc')
makedepends=('meson' 'wayland-protocols')
optdepends=('hyprland: greeter session and lock-screen integration'
            'greetd: login-screen keyboard via slatekbd-greeter-session')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('215c569fe08c5c230f85eb81816b9b1092e9deed78a1c26ff704b44168c92db2')

prepare() {
  cd "$pkgname-$pkgver"
  # packaged under /usr, not /usr/local
  sed -i 's|/usr/local/|/usr/|g' greeter/slatekbd-greeter-session greeter/hyprland.lua
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
