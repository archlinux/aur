# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=youtube-video-downloader
pkgver=2.0.2
pkgrel=1
pkgdesc="Fast desktop front-end for yt-dlp with a download queue (Tauri)"
arch=('x86_64')
options=('!debug' '!lto')
url="https://github.com/RamazanBerk20/youtube-video-downloader"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'glib2' 'dbus' 'ffmpeg')
optdepends=(
  'deno: JavaScript runtime for the YouTube challenge solver (nodejs or bun also work)'
  'nodejs: JavaScript runtime for the YouTube challenge solver (alternative to deno)'
  'gnome-keyring: secret service that stores the anyIP proxy password (kwallet also works)'
  'xdg-utils: open the output folder and links in the default handler'
)
makedepends=('cargo' 'pnpm' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0fab228cce7705199b51eed130adad907dcc9bd99d37a51e4c5709b9be218bef')

prepare() {
  cd "$pkgname-$pkgver"
  # All network fetches happen here so build() and check() work offline.
  export CARGO_HOME="$srcdir/cargo-home"
  local target
  target="$(rustc -vV | sed -n 's/host: //p')"
  pnpm install --frozen-lockfile
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$target"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  pnpm build
  # custom-protocol embeds ../dist; without it the binary would load the dev server URL.
  cargo build --manifest-path src-tauri/Cargo.toml --release --frozen \
    --bin youtube-downloader --features tauri/custom-protocol
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  pnpm test
  cargo test --manifest-path src-tauri/Cargo.toml --all-targets --release --frozen \
    --features tauri/custom-protocol
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 src-tauri/target/release/youtube-downloader "$pkgdir/usr/bin/youtube-downloader"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/youtube-downloader.desktop" <<'DESKTOP'
[Desktop Entry]
Categories=Utility;
Comment=Download videos and audio with yt-dlp
Exec=youtube-downloader
StartupWMClass=youtube-downloader
Icon=youtube-downloader
Name=YouTube Downloader
Terminal=false
Type=Application
DESKTOP
  local size
  for size in 32 64 128; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/youtube-downloader.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/youtube-downloader.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
