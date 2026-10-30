# Maintainer: Novaturiente
# pkgver and sha256sums are filled in by packaging/release.sh
pkgname=novabrowser-webkit
pkgver=0.1.8
pkgrel=1
pkgdesc="Keyboard-driven browser on WebKitGTK 6.0, configured in TypeScript"
arch=(x86_64)
url="https://github.com/Novaturiente/novabrowser-webkit"
license=(GPL-3.0-or-later)
depends=(libwebkitgtk-6.0.so gtk4 glib2 sqlite curl gst-plugins-base gst-plugins-good)
makedepends=(cargo)
optdepends=('webkitgtk-6.0-nova-bin: our WebKitGTK build (Chromium-like dark mode, PGO, AVX2 CPUs)'
            'gst-libav: H.264/AAC and most web video'
            'gst-plugins-bad: more codecs (AV1, HLS)'
            'gst-plugin-va: hardware video decoding'
            'aria2: faster downloads (8 connections), resume after restart, magnet links and torrents'
            'rbw: Bitwarden passwords'
            'pass: password-store passwords'
            'bitwarden-cli: Bitwarden passwords (bw)'
            'xdg-utils: download-open and default-browser setup')
conflicts=(novabrowser-webkit-bin novabrowser-webkit-git)
options=(strip !lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a88104b69783d1409532228ccc18285d7f92ea72d8be33a8bdd385b8626faa4b')
_src=$pkgname-$pkgver

prepare() {
  cd "$_src"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_env() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"  # no build paths in panic messages
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/build"  # QuickJS C sources use __FILE__
}

build() {
  cd "$_src"
  _env
  cargo build --release --frozen --workspace
}

check() {
  cd "$_src"
  _env
  cargo test --release --frozen --workspace
}

package() {
  cd "$_src"
  local r=target/release
  install -Dm755 $r/novabrowser-webkit "$pkgdir/usr/bin/novabrowser-webkit"
  # web process extension (adblock, HTTPS upgrades, headers): the binary looks here
  install -Dm755 $r/libnovabrowser_webkit_ext.so "$pkgdir/usr/lib/novabrowser-webkit/libnovabrowser_webkit_ext.so"
  install -Dm644 packaging/novabrowser-webkit.desktop "$pkgdir/usr/share/applications/novabrowser-webkit.desktop"
  install -Dm644 packaging/novabrowser-webkit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/novabrowser-webkit.svg"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 packaging/icons/novabrowser-webkit-$s.png "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/novabrowser-webkit.png"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/novabrowser-webkit/README.md"
  cp -r docs "$pkgdir/usr/share/doc/novabrowser-webkit/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
