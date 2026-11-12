# Maintainer: massiveadam <massiveadam@users.noreply.github.com>
pkgname=massiveeq-git
pkgver=0.3.0.beta.2.r40.ga7b8cdd
pkgrel=1
pkgdesc='Beta device-aware equalizer for PipeWire and Wayland desktops'
arch=('x86_64')
url='https://github.com/massiveadam/massiveeq'
license=('MIT')
depends=('pipewire>=1:1.4' 'libpipewire' 'wireplumber>=0.5' 'gtk4>=4.18' 'libadwaita>=1.8' 'glib2' 'cairo' 'libsndfile' 'libsamplerate' 'curl' 'glibc' 'libgcc' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'git' 'python')
optdepends=('carla: native VST3/LV2 microphone plugin hosting'
            'pipewire-jack: independent microphone plugin routing'
            'python: microphone companion'
            'lsp-plugins-lv2: microphone EQ, gate and compressor'
            'noise-suppression-for-voice: microphone RNNoise noise reduction')
provides=('massiveeq')
conflicts=('massiveeq')
options=('!debug')
install=massiveeq.install
source=("$pkgname::git+https://github.com/massiveadam/massiveeq.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local _base_pkgver='0.3.0.beta.2'
  local _described
  _described=$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g') || true

  if [[ -n "$_described" ]] && (( $(vercmp "$_described" "$_base_pkgver") >= 0 )); then
    printf '%s' "$_described"
  else
    printf '%s.r%s.g%s' "$_base_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$pkgname"
  local _target
  _target=$(rustc -vV | sed -n 's/^host: //p')
  cargo fetch --locked --target "$_target"
}

build() {
  cd "$pkgname"
  cargo build --release --frozen
}

check() {
  cd "$pkgname"
  cargo test --workspace --release --frozen
  PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -p test_microphone.py -v
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/massiveeq "$pkgdir/usr/bin/massiveeq"
  install -Dm755 target/release/massiveeqd "$pkgdir/usr/bin/massiveeqd"
  install -Dm755 target/release/massiveeq-tray "$pkgdir/usr/bin/massiveeq-tray"
  install -Dm755 target/release/massiveeqctl "$pkgdir/usr/bin/massiveeqctl"
  install -Dm755 packaging/massiveeq-input "$pkgdir/usr/bin/massiveeq-input"
  install -Dm644 packaging/massiveeq-input.service "$pkgdir/usr/lib/systemd/user/massiveeq-input.service"
  install -Dm644 packaging/input/input.json "$pkgdir/usr/share/massiveeq/input/input.json"
  install -Dm644 docs/microphone-plugins.md "$pkgdir/usr/share/doc/$pkgname/microphone-plugins.md"
  install -Dm644 packaging/massiveeq.service "$pkgdir/usr/lib/systemd/user/massiveeq.service"
  install -Dm644 packaging/massiveeq-tray.service "$pkgdir/usr/lib/systemd/user/massiveeq-tray.service"
  install -Dm644 packaging/org.massiveeq.Service1.service "$pkgdir/usr/share/dbus-1/services/org.massiveeq.Service1.service"
  install -Dm644 packaging/org.massiveeq.MassiveEQ.desktop "$pkgdir/usr/share/applications/org.massiveeq.MassiveEQ.desktop"
  install -Dm644 packaging/org.massiveeq.MassiveEQ.metainfo.xml "$pkgdir/usr/share/metainfo/org.massiveeq.MassiveEQ.metainfo.xml"
  install -Dm644 packaging/org.massiveeq.MassiveEQ.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.massiveeq.MassiveEQ.svg"
  install -Dm644 packaging/waybar/tray.jsonc "$pkgdir/usr/share/massiveeq/waybar/tray.jsonc"
  install -Dm644 docs/waybar-omarchy.md "$pkgdir/usr/share/doc/$pkgname/waybar-omarchy.md"
  install -dm755 "$pkgdir/usr/share/massiveeq/noctalia-v4/massiveeq"
  cp -a packaging/noctalia-v4/massiveeq/. "$pkgdir/usr/share/massiveeq/noctalia-v4/massiveeq/"
  install -dm755 "$pkgdir/usr/share/massiveeq/noctalia-v5/massiveeq"
  cp -a packaging/noctalia-v5/massiveeq/. "$pkgdir/usr/share/massiveeq/noctalia-v5/massiveeq/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
