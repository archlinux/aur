# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-git
pkgver=1.0.1.r28.g7f089ab
pkgrel=1
pkgdesc='Development version of the Linux-native Wayland terminal built on Ghostty terminal core'
arch=('x86_64')
url='https://github.com/rockorager/monstar'
license=('MIT')
depends=(
  'dbus'
  'fontconfig'
  'freetype2'
  'glibc'
  'harfbuzz'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'git'
  'ncurses'
  'wayland-protocols>=1.49'
  'zig>=0.16.0'
)
optdepends=(
  'noto-fonts-emoji: emoji support'
  'noto-fonts-cjk: CJK font support'
  'systemd: launch additional terminal windows'
  'xdg-desktop-portal: open links and files through a desktop portal'
  'xdg-utils: open links when a desktop portal is unavailable'
)
provides=('monstar')
conflicts=('monstar')
source=('monstar::git+https://github.com/rockorager/monstar.git')
sha256sums=('SKIP')

pkgver() {
  cd monstar
  git describe --long --tags --match 'v[0-9]*' | \
    sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/'
}

prepare() {
  cd monstar
  zig build --fetch
}

build() {
  cd monstar
  rm -rf "$srcdir/monstar-build"

  DESTDIR="$srcdir/monstar-build" zig build \
    --prefix /usr \
    --build-id=sha1 \
    -Doptimize=ReleaseFast \
    -Dcpu=baseline
}

package() {
  cp -a "$srcdir/monstar-build/." "$pkgdir/"
  install -Dm644 "$srcdir/monstar/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
