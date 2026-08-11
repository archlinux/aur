# Maintainer: Polyfrost <contact@atmofrost.org>
pkgname=oneclient
pkgver=2.2.2
pkgrel=1
pkgdesc="Next-generation open source Minecraft launcher (built from source)"
arch=('x86_64')
url="https://github.com/Polyfrost/OneLauncher"
license=('GPL-3.0-only')
depends=(
  'fontconfig'
  'freetype2'
  'libglvnd'
  'libxcursor'
  'libxrandr'
  'libxi'
  'libxkbcommon'
  'wayland'
  'dbus'
  'gtk3'
)
makedepends=(
  'rust'
  'cargo'
  'cmake'
  'clang'
  'pkgconf'
  'python'
)
provides=('oneclient')
conflicts=('oneclient-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/oneclient-${pkgver}.tar.gz")
sha256sums=('c108b694c319174fed91433f97bd90accef02c12da1893d20de8e2b722544a0f')

_srcdir="OneLauncher-oneclient-${pkgver}"

prepare() {
  cd "$srcdir/$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --bin oneclient_app
}

package() {
  cd "$srcdir/$_srcdir"
  local appdir="packages/oneclient_app"

  install -Dm755 "target/release/oneclient_app" "$pkgdir/usr/bin/oneclient_app"
  ln -s oneclient_app "$pkgdir/usr/bin/oneclient"

  install -dm755 "$pkgdir/usr/share/applications"
  sed -e 's|{{exec}}|oneclient_app|g' \
      -e 's|{{icon}}|org.polyfrost.OneClient|g' \
      "$appdir/distribution/linux/org.polyfrost.oneclient.template" \
      > "$pkgdir/usr/share/applications/org.polyfrost.OneClient.desktop"

  install -Dm644 "$appdir/icons/32x32.png"    "$pkgdir/usr/share/icons/hicolor/32x32/apps/org.polyfrost.OneClient.png"
  install -Dm644 "$appdir/icons/128x128.png"  "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.polyfrost.OneClient.png"
  install -Dm644 "$appdir/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.polyfrost.OneClient.png"
  install -Dm644 "$appdir/icons/512x512.png"  "$pkgdir/usr/share/icons/hicolor/512x512/apps/org.polyfrost.OneClient.png"
}
