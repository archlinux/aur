# Maintainer: Mazlum <https://github.com/MrMazlum/Earshot>
# Earshot -git: always builds the tip of main, so reinstalling always gives
# you the latest commit. For the pinned release binary without compiling,
# use earshot-bin instead.
pkgname=earshot-git
_pkgname=earshot
pkgver=1.1.0.r39.g3d6ebd2
pkgrel=1
pkgdesc="Use your phone as your PC's microphone, over Wi-Fi (latest git)"
arch=('x86_64')
url="https://github.com/MrMazlum/Earshot"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'dbus' 'hicolor-icon-theme')
makedepends=('git' 'cargo' 'cmake' 'pkgconf' 'alsa-lib' 'dbus')
optdepends=(
  'pulseaudio-utils: virtual microphone via pactl (PulseAudio)'
  'pipewire-pulse: virtual microphone via pactl (PipeWire)'
  'gnome-shell-extension-appindicator: tray icon on GNOME'
)
provides=('earshot')
conflicts=('earshot' 'earshot-bin')
source=("git+https://github.com/MrMazlum/Earshot.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Single source of truth is receiver/Cargo.toml; suffix counts commits
  # since the v<version> tag so the version always moves forward.
  ver=$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' receiver/Cargo.toml | head -1)
  printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname/receiver"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm0755 receiver/target/release/earshot-receiver "$pkgdir/usr/bin/earshot-receiver"
  install -Dm0755 receiver/target/release/earshot-tray "$pkgdir/usr/bin/earshot-tray"
  install -Dm0644 packaging/earshot.desktop "$pkgdir/usr/share/applications/earshot.desktop"
  install -Dm0644 docs/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/earshot.png"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
