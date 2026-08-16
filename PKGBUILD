# Maintainer: Dilant <dilant@qq.com>

pkgname=celemod
pkgver=1.1.9
pkgrel=1
pkgdesc="An alternative mod manager for Celeste"
arch=('x86_64')
url="https://github.com/std-microblock/CeleMod"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glib2'
  'gtk3'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo-nightly'
  'cmake'
  'nodejs>=20'
  'pnpm'
  'rust-nightly'
)
provides=('cele-mod')
options=('!lto')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/std-microblock/CeleMod/archive/refs/tags/v$pkgver.tar.gz"
  'CeleMod.desktop'
  'disable-self-update.patch'
)
sha256sums=(
  '85c16bc87bdcd7cdab4789f2bc0b375c03199f7786de0f078d4e54915a75c5b7'
  '683c5ab3017cb560d715576e0eb0342833f22b52ad17d9594499dfd2a7655c42'
  '9e15105a6ba14a14b6e766689662841195096d2b2ae9bad3568520d69f689778'
)

prepare() {
  cd "$srcdir/CeleMod-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  rustup toolchain install nightly --profile minimal
  patch -p1 -i "$srcdir/disable-self-update.patch"
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/CeleMod-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  pnpm install --dir src/celemod-ui --frozen-lockfile
  pnpm --dir src/celemod-ui tauri build --bundles deb
}

package() {
  local debdir
  debdir="$(echo "$srcdir/CeleMod-$pkgver/target/release/bundle/deb"/*/data)"
  install -Dm755 "$srcdir/CeleMod-$pkgver/target/release/cele-mod" \
    "$pkgdir/usr/bin/cele-mod"
  install -Dm644 "$srcdir/CeleMod.desktop" \
    "$pkgdir/usr/share/applications/CeleMod.desktop"
  install -Dm644 "$debdir/usr/share/icons/hicolor/128x128/apps/cele-mod.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/cele-mod.png"
  install -Dm644 "$srcdir/CeleMod-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
