# Maintainer: lemon <lemonadorable@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=micyou-git
pkgver=2.0.0.alpha.1.r590.g06bf23c
pkgrel=1
pkgdesc="Turn your Android device into a wireless microphone (development version)"
arch=('x86_64')
keywords=('android' 'audio' 'microphone' 'pipewire' 'pulseaudio' 'wireless')
url="https://github.com/LanRhyme/MicYou"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libpulse'
  'libsoup3'
  'openssl'
  'pango'
  'pipewire'
  'webkit2gtk-4.1'
  'wireplumber'
)
makedepends=(
  'git'
  'mold'
  'rust'
  'cargo'
  'nodejs'
  'npm'
  'pkgconf'
)
optdepends=(
  'android-tools: USB connectivity support'
  'xdg-utils: open URLs in the default browser'
)
provides=('micyou')
conflicts=('micyou' 'micyou-bin')
source=(
  'git+https://github.com/LanRhyme/MicYou.git'
  'micyou.desktop'
)
b2sums=(
  'SKIP'
  'd72476f0b91fe3ec793d69b6a4c3546607149d1779a1e357284df23e7801aadff39fd5566a002fb4eb0d5393f8d03d4edc65408db8ddb485b8b912362015410e'
)

pkgver() {
  cd MicYou

  local base_version
  base_version=$(sed -n 's/^project.version=//p' gradle.properties | tr '-' '.')
  printf '%s.r%s.g%s' \
    "$base_version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd MicYou/tauri-app
  npm ci
  npx vite build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold" npx tauri build --no-bundle \
    --config '{"build":{"beforeBuildCommand":""}}'
}

package() {
  cd MicYou

  install -Dm755 tauri-app/target/release/micyou-app \
    "$pkgdir/usr/bin/micyou"

  install -Dm644 tauri-app/src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/micyou.png"
  install -Dm644 tauri-app/src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/micyou.png"

  install -Dm644 "$srcdir/micyou.desktop" \
    "$pkgdir/usr/share/applications/micyou.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/micyou/LICENSE"
}
