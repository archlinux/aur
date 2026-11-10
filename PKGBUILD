# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar
pkgver=1.1.1
pkgrel=1
pkgdesc='Linux-native Wayland terminal built on Ghostty terminal core'
arch=('x86_64' 'aarch64')
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
  'ncurses'
  'vulkan-headers'
  'wayland-protocols>=1.49'
  'zig>=0.17.0'
)
optdepends=(
  'noto-fonts-emoji: emoji support'
  'noto-fonts-cjk: CJK font support'
  'systemd: launch additional terminal windows as user services'
  'vulkan-icd-loader: GPU rendering with renderer = vulkan'
  'xdg-desktop-portal: open links and files through a desktop portal'
  'xdg-utils: open links when a desktop portal is unavailable'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('d3b8775a91bf04e31164089a7799b52ceb87c9dd16e80c68f05c19f8b0f99af5')

prepare() {
  cd "$pkgname-$pkgver"
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  rm -rf "$srcdir/monstar-build"

  DESTDIR="$srcdir/monstar-build" zig build \
    --prefix /usr \
    --build-id=sha1 \
    -Doptimize=fast \
    -Dcpu=baseline
}

package() {
  cp -a "$srcdir/monstar-build/." "$pkgdir/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
