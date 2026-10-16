# Maintainer: Avi Tretiak <contact at avitretiak dot dev>
pkgname=wayleaf-4d
pkgver=0.3.0
pkgrel=1
pkgdesc='KDE Plasma 6 screen-edge color sync for Nanoleaf 4D'
arch=('x86_64')
url='https://github.com/avitretiak/wayleaf-4d'
license=('GPL-3.0-or-later')
depends=(
  'curl'
  'gcc-libs'
  'libdrm'
  'libplasma'
  'plasma-workspace'
  'kirigami'
  'qt6-declarative'
  'hicolor-icon-theme'
)
makedepends=('cargo')
optdepends=(
  'gpu-screen-recorder: screen capture for 2D, 3D, and 4D modes'
  'avahi: mDNS device discovery'
)
source=(
  "https://github.com/avitretiak/wayleaf-4d/releases/download/v${pkgver}/wayleaf-4d-${pkgver}.tar.gz"
  "wayleaf-4d-${pkgver}-vendor.tar.gz::https://github.com/avitretiak/wayleaf-4d/releases/download/v${pkgver}/wayleaf-4d-${pkgver}-vendor.tar.gz"
)
sha256sums=(
  '0eeaf73d3e278fd3889112f912792e3268c998df0b7439497852311374672057'
  '8a6c4554a926e9a3908060a80789c3b75336f552d333e987e015810d4dc5d755'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  tar -xf "$srcdir/wayleaf-4d-$pkgver-vendor.tar.gz"
  mkdir -p .cargo
  cat > .cargo/config.toml <<'EOF'
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "aur-vendor"
EOF
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make check-shaders
  RUSTUP_TOOLCHAIN=stable RUSTFLAGS="--remap-path-prefix=$srcdir=." \
    CARGO_HOME="$srcdir/cargo-home" CARGO_TARGET_DIR="$srcdir/target" \
    cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable RUSTFLAGS="--remap-path-prefix=$srcdir=." \
    CARGO_HOME="$srcdir/cargo-home" CARGO_TARGET_DIR="$srcdir/target" \
    cargo test --frozen
}

package() {
  local _app_id='io.github.avitretiak.Wayleaf4D'
  local _applet="$srcdir/$pkgname-$pkgver/share/plasma/$_app_id"

  install -Dm755 "$srcdir/target/release/wayleaf-4d" "$pkgdir/usr/bin/wayleaf-4d"
  install -Dm644 "$srcdir/$pkgname-$pkgver/share/systemd/user/wayleaf-4d.service" \
    "$pkgdir/usr/lib/systemd/user/wayleaf-4d.service"
  sed -i 's|ExecStart=%h/.local/bin/wayleaf-4d|ExecStart=/usr/bin/wayleaf-4d|' \
    "$pkgdir/usr/lib/systemd/user/wayleaf-4d.service"

  install -Dm644 "$srcdir/$pkgname-$pkgver/share/applications/$_app_id.desktop" \
    "$pkgdir/usr/share/applications/$_app_id.desktop"
  install -Dm644 "$_applet/contents/ambient-light.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app_id.svg"
  install -Dm644 "$_applet/metadata.json" \
    "$pkgdir/usr/share/plasma/plasmoids/$_app_id/metadata.json"
  install -d "$pkgdir/usr/share/plasma/plasmoids/$_app_id/contents"
  cp -a "$_applet/contents/." "$pkgdir/usr/share/plasma/plasmoids/$_app_id/contents/"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/dbus-1/services/$_app_id.Control.service" <<'EOF'
[D-BUS Service]
Name=io.github.avitretiak.Wayleaf4D.Control
Exec=/usr/bin/wayleaf-4d --control
EOF
}
