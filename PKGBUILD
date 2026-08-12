# Maintainer: lemon <lemonadorable@gmail.com>
# Maintainer: raindropQwQ <rainqwq.dev@gmail.com>
# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname=micyou-git
pkgver=2.0.1.r774.gb22c41f
pkgrel=1
pkgdesc="Turn your Android device into a wireless microphone (development version)"
arch=('x86_64')
keywords=('android' 'audio' 'microphone' 'pipewire' 'pulseaudio' 'wireless')
url="https://github.com/LanRhyme/MicYou"
license=('GPL-3.0-only' 'MIT')
depends=(
  'alsa-lib'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
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
source=('git+https://github.com/LanRhyme/MicYou.git')
b2sums=('SKIP')

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
  # Strip LTO flags – cc-rs picks them up and GCC LTO IR confuses rust-lld
  export CFLAGS="${CFLAGS//-flto*/}"
  export CXXFLAGS="${CXXFLAGS//-flto*/}"

  cd MicYou/tauri-app
  npm install
  npm run tauri -- build --no-bundle
}

package() {
  cd MicYou

  # Install binary
  for _name in micyou micyou-cli micyou-tui; do
    install -Dm755 tauri-app/target/release/$_name \
      "$pkgdir/usr/bin/$_name"
  done

  # Install icons
  install -Dm644 tauri-app/src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/micyou.png"
  install -Dm644 tauri-app/src-tauri/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/micyou.png"
  install -Dm644 tauri-app/src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/micyou.png"
  install -Dm644 tauri-app/src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/micyou.png"

  # Install desktop file
  cat <<EOF >"micyou.desktop"
[Desktop Entry]
Type=Application
Name=MicYou
Comment=Use an Android device as a wireless microphone
Exec=micyou
Icon=micyou
Terminal=false
Categories=AudioVideo;Audio;
Keywords=android;audio;microphone;pipewire;pulseaudio;wireless;
StartupWMClass=MicYou
EOF
  install -Dm644 micyou.desktop "$pkgdir/usr/share/applications/micyou.desktop"

  # Install LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/micyou/LICENSE"
  install -Dm644 tauri-app/src-tauri/resources/LICENSE-AEC7.txt "$pkgdir/usr/share/licenses/micyou/LICENSE-AEC7.txt"
  install -Dm644 tauri-app/src-tauri/resources/LICENSE-PureVox.txt "$pkgdir/usr/share/licenses/micyou/LICENSE-PureVox.txt"
}
