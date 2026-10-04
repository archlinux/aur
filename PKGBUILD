# Maintainer: Joshua Rosato <joshuarosato at hotmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>

pkgname=foot-tabs
pkgver=1.28.0.tabs1
pkgrel=1
pkgdesc='Fast, lightweight and minimalistic Wayland terminal emulator (unofficial fork with tabs)'
arch=(x86_64 aarch64)
url='https://github.com/joshuarosato/foot-tabs'
license=(MIT)
depends=(
  fcft
  fontconfig
  hicolor-icon-theme
  libfcft.so
  libutf8proc
  libxkbcommon
  ncurses
  pixman
  wayland
)
makedepends=(
  meson
  python
  scdoc
  tllist
  wayland-protocols
)
optdepends=(
  'foot-terminfo: extra non-standard features over terminfo included in ncurses'
  'libnotify: desktop notifications'
  'libutempter: utmp logging'
  'xdg-utils: URI launching'
)
provides=("foot=${pkgver%.tabs*}")
conflicts=(foot)
backup=(etc/xdg/foot/foot.ini)
_tag=${pkgver/.tabs/-tabs}
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('9588316e75acb3f45b71b98f899b256f488f76227775ecd51f6acfccc611c051')

build() {
  arch-meson "$pkgname-$_tag" build \
    -Dwerror=false \
    -Dterminfo-base-name=foot-extra
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Provided by foot-terminfo
  rm -r "$pkgdir/usr/share/terminfo"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname-$_tag/LICENSE"
}
