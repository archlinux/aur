# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=mini-downloader
pkgver=3.3.0
pkgrel=1
pkgdesc="Lightweight native download manager (aria2 + yt-dlp, browser capture)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/mini-downloader"
license=('GPL-3.0-or-later')
depends=('aria2' 'fontconfig' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'wayland' 'xdg-utils')
optdepends=('yt-dlp: video, HLS, and DASH downloads'
            'ffmpeg: merge media streams, embed subtitles/thumbnails, and convert audio')
makedepends=('rust' 'cargo' 'git' 'pkgconf')
provides=('mini-downloader')
conflicts=('mini-downloader-bin' 'mini-downloader-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replace with updpkgsums before publishing this version to the AUR.
sha256sums=('b776ae743e4c2beb8aafbe2155bbe85f21b4b03b39eead52b1adf4ad0e5284d7')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}
build() {
  cd "$pkgname-$pkgver"
  local separator=$'\x1f'
  local rustflags="${CARGO_ENCODED_RUSTFLAGS:-}"
  [[ -z "$rustflags" ]] || rustflags+="$separator"
  rustflags+="--remap-path-prefix=$srcdir/$pkgname-$pkgver=."
  rustflags+="$separator--remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  CARGO_ENCODED_RUSTFLAGS="$rustflags" CARGO_TARGET_DIR=target \
    cargo build --frozen --release \
    -p minidl-native-desktop -p minidl-native-host
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/mini-downloader \
    "$pkgdir/usr/bin/mini-downloader"
  install -Dm755 target/release/minidl-native-host \
    "$pkgdir/usr/bin/minidl-native-host"
  install -Dm644 assets/icons/512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/mini-downloader.png"
  install -Dm644 packaging/linux/io.minidownloader.app.desktop \
    "$pkgdir/usr/share/applications/io.minidownloader.app.desktop"
  install -Dm644 packaging/linux/io.minidownloader.app.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.minidownloader.app.metainfo.xml"
  install -Dm644 packaging/com.minidownloader.host.json \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.minidownloader.host.json"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 PRIVACY.md SECURITY.md THIRD_PARTY_NOTICES.md THIRD_PARTY_LICENSES.txt \
    -t "$pkgdir/usr/share/doc/$pkgname"
}
