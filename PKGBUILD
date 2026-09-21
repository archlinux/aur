# Maintainer: TheSw1m <swim853279614@163.com>
# Contributor: Dilant <dilant@qq.com>

pkgname=celemod
pkgver=1.2.1
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
)

provides=('cele-mod')
options=('!lto')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/std-microblock/CeleMod/archive/refs/tags/v$pkgver.tar.gz"
  'CeleMod.desktop'
  'disable-self-update.patch'
)
sha256sums=('dfc9ea2c535fba508b22ed5404e86e4bb44a4e7273aa2b11158fd3124380e4bf'
            '683c5ab3017cb560d715576e0eb0342833f22b52ad17d9594499dfd2a7655c42'
            '808ef279cf059a2fcdf25dd4b040a41866670aa27161b1d532ff67fc65cef303')

prepare() {
  cd "$srcdir/CeleMod-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  patch -p1 -i "$srcdir/disable-self-update.patch"
  cargo fetch --locked --target x86_64-unknown-linux-gnu
  pnpm install --dir src/celemod-ui --frozen-lockfile
}

build() {
  cd "$srcdir/CeleMod-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR="$srcdir/CeleMod-$pkgver/target"
  export CARGO_NET_OFFLINE=true
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  pnpm --dir src/celemod-ui tauri build --bundles deb
}

package() {
  cd "$srcdir/CeleMod-$pkgver"
  install -Dm755 target/release/cele-mod \
    "$pkgdir/usr/bin/cele-mod"
  install -Dm644 "$srcdir/CeleMod.desktop" \
    "$pkgdir/usr/share/applications/CeleMod.desktop"
  install -Dm644 resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/cele-mod.png"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
