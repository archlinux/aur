# Maintainer: Joshua Rosato <joshuarosato at hotmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>

pkgname=foot-tabs-git
pkgver=1.28.0.tabs1.r0.ge9e7a8c
pkgrel=1
pkgdesc='Fast, lightweight and minimalistic Wayland terminal emulator (unofficial fork with tabs, development version)'
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
  git
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
provides=(foot foot-tabs)
conflicts=(foot foot-tabs)
backup=(etc/xdg/foot/foot.ini)
source=("$pkgname::git+$url.git#branch=tabs")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build \
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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
}
