# Maintainer: Ryan <ryan@freyja.pw>
pkgname=nlink-ng
pkgver=0.5.0
pkgrel=1
pkgdesc="Native Qt 6 linking program for TI-Nspire calculators (CX-II included)"
arch=('x86_64')
url="https://github.com/RyanHakurei/nlink-ng"
license=('GPL-3.0-only')
depends=('qt6-base' 'libusb' 'hicolor-icon-theme')
makedepends=('cmake' 'rust' 'pkgconf' 'git')
optdepends=('qt6-wayland: Wayland support')
provides=('n-link')
conflicts=('n-link' 'n-link-git' 'n-link.bin')
replaces=('n-link')
options=('!lto')
install=nlink-ng.install
source=(
  "git+https://github.com/RyanHakurei/nlink-ng.git#tag=v$pkgver"
  "69-nlink-ng.rules"
)
sha256sums=(
  'SKIP'
  '10007d13980e1d6a3e92c4e843a908ea58531155bce0583c826940bf64423bec'
)

prepare() {
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --manifest-path "$srcdir/nlink-ng/nlink/Cargo.toml" \
    --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_NET_OFFLINE=true
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix ${srcdir}="

  cmake -S "$srcdir/nlink-ng/qt" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  local src="$srcdir/nlink-ng"
  install -Dm644 "$src/qt/nlink-ng.desktop" \
    "$pkgdir/usr/share/applications/nlink-ng.desktop"
  install -Dm644 "$src/qt/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/nlink-ng.png"
  install -Dm644 "$srcdir/69-nlink-ng.rules" \
    "$pkgdir/usr/lib/udev/rules.d/69-nlink-ng.rules"
  install -Dm644 "$src/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
