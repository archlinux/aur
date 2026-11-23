# Maintainer: mahirsn <mahirsuna72@gmail.com>
#
# Built from source with ./install.sh before? Run ./install.sh --uninstall in that checkout
# first: its login sessions are in the way of this package's.

pkgname=digit-git
pkgver=r298.29b963c
pkgrel=1
pkgdesc='A calm GTK4 desktop for Hyprland and niri'
arch=(x86_64)
url='https://github.com/altugcetin/digit'
license=(MIT)
depends=(
  gtk4 gtk4-layer-shell glib2 cairo pango gdk-pixbuf2 graphene wayland pam
  gvfs polkit upower playerctl wtype curl slurp xdg-desktop-portal-gtk
  ttf-material-symbols-variable ttf-readex-pro-variable ttf-rubik-vf
)
makedepends=(cargo git)
optdepends=(
  'hyprland: compositor for the "Hyprland with Digit" session'
  'xdg-desktop-portal-hyprland: screen sharing on Hyprland'
  'niri: compositor for the "niri with Digit" session'
  'xdg-desktop-portal-gnome: screen sharing on niri'
  'kitty: terminal for Super+Return when no other is installed'
  'pipewire-pulse: volume and the sound mixer'
  'wireplumber: volume when the PulseAudio connection is missing'
  'networkmanager: Wi-Fi and network in Control Center and Settings'
  'bluez: Bluetooth in Control Center and Settings'
  'power-profiles-daemon: power modes in Control Center'
  'fwupd: firmware updates in Settings'
  'wl-clipboard: screenshots stay on the clipboard after Snap closes'
  'tesseract: copying text from a screenshot'
  'scrcpy: mirroring a phone screen'
  'android-tools: mirroring a phone over USB'
  'bubblewrap: thumbnails from other apps in Digit Files'
  'libjxl: JPEG XL app icons in Digit Store'
  'flatpak: apps from Flathub in Digit Store'
  'archlinux-appstream-data: system apps in Digit Store'
  'packagekit: installing drivers and packages from Settings and Files'
  'gvfs-mtp: phones plugged in over USB in Digit Files'
  'gvfs-afc: iPhones plugged in over USB in Digit Files'
  'kdeconnect: phones over Wi-Fi in Digit Files'
  'gst-plugins-good: video and audio previews in Digit Files'
  'gst-libav: more video formats in Digit Files'
  'gpu-screen-recorder: screen recording'
  'cava: the audio visualizer'
  'squashfs-tools: opening AppImages in Digit Store'
  'fuse2: running AppImages'
  'adw-gtk-theme: GTK 3 apps in the Digit look'
  'breeze: Qt apps in the Digit look'
  'qt6ct: Qt apps following Digit colors'
)
provides=(digit)
conflicts=(digit)
backup=(etc/pam.d/digit)
install=digit.install
source=("digit::git+$url.git")
sha256sums=(SKIP)

_bins=(digit digitctl digit-settings digit-store digit-files digit-snap)

pkgver() {
  cd digit
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd digit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd digit
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p digit-shell -p digitctl -p digit-settings -p digit-store -p digit-files -p digit-snap
}

package() {
  cd digit
  local b
  for b in "${_bins[@]}"; do
    install -Dm755 "target/release/$b" "$pkgdir/usr/bin/$b"
  done
  install -Dm755 data/session/digit-session "$pkgdir/usr/bin/digit-session"
  install -Dm644 -t "$pkgdir/usr/share/wayland-sessions" data/session/*.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" data/applications/*.desktop
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" data/icons/hicolor/scalable/apps/*.svg
  install -Dm644 data/pam/digit "$pkgdir/etc/pam.d/digit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
