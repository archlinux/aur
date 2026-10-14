# Maintainer: Kolimi <ci@kolimi.local>
pkgname=kolimi-desktop
pkgver=0.1.18
pkgrel=1
pkgdesc="Kolimi desktop client: browse, share, and keep a local folder in sync"
arch=('x86_64' 'aarch64')
url="https://github.com/chaitanyayeleti/kolimi"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chaitanyayeleti/kolimi/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('2a411780b45a41ea45814a1ad3a45c8ad23e4a0166fba23b3b2eae199bd5c983')

build() {
  cd "kolimi-desktop-v$pkgver/apps/kolimi-desktop"
  export RUSTUP_TOOLCHAIN=stable
  # aws-lc-sys (pulled in by rustls) requires -O0 for its jitterentropy RNG,
  # but Arch's hardened CFLAGS force -O2 afterwards, tripping a compile-time
  # #error. Disable the jitterentropy fallback so the OS RNG is used instead.
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo build --release --locked
}

package() {
  cd "kolimi-desktop-v$pkgver/apps/kolimi-desktop"
  install -Dm755 target/release/kolimi-desktop "$pkgdir/usr/bin/kolimi-desktop"
  for size in 32x32 128x128 512x512; do
    install -Dm644 "icons/$size.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/kolimi-desktop.png"
  done
  install -Dm644 icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/kolimi-desktop.png"
  install -Dm644 icons/icon.png "$pkgdir/usr/share/pixmaps/kolimi-desktop.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kolimi-desktop.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Kolimi
Comment=Kolimi desktop client
Exec=kolimi-desktop
Icon=kolimi-desktop
Categories=Utility;Network;
Terminal=false
EOF
}
