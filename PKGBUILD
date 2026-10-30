# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=openxlr
pkgver=0.3.3
pkgrel=1
pkgdesc="A Wave Link replacement for Linux: a PipeWire mixer with effects and an OpenDeck plugin for any microphone, plus full control of Elgato XLR interfaces and Wave microphones"
arch=('x86_64')
url="https://github.com/emaspa/openxlr"
license=('GPL-3.0-only' 'BSD-3-Clause' 'MIT' 'Apache-2.0' 'CC0-1.0')
depends=('aspnet-runtime' 'pipewire' 'pipewire-pulse' 'wireplumber' 'libpulse' 'libusb' 'lilv'
         'fontconfig' 'libx11' 'libice' 'libsm' 'glib2' 'libsndfile')
makedepends=('dotnet-sdk' 'dotnet-targeting-pack' 'lv2' 'pkgconf' 'python' 'cargo')
optdepends=('swh-plugins: software ClipGuard for the XLR Dock'
            'lsp-plugins-lv2: a starter set of LV2 plugins for the inserts'
            'opendeck: Stream Deck control through the bundled plugin'
            'gdk-pixbuf2: SVG application icons in the UI'
            'librsvg: SVG application icons in the UI'
            'xorg-xprop: focused application on X11 desktops')
install=openxlr.install
backup=('etc/chromium/native-messaging-hosts/com.emaspa.openxlr.browser.json'
        'etc/opt/chrome/native-messaging-hosts/com.emaspa.openxlr.browser.json')
# The receipt below hashes the payload; makepkg must not strip it afterwards.
# makepkg.conf adds -C debuginfo=2 to RUSTFLAGS, which nothing would strip.
options=('!strip' '!debug')

# Omarchy 4 replaced Waybar with its own Quickshell process, whose bar is
# built from plugins. Ship the mixer's bar plugin only when the build host
# has that shell, so a package built on plain Arch is unchanged.
_openxlr_omarchy=0
if [[ -f /usr/share/omarchy/shell/Ui/PluginBarApi.qml ]]; then
    _openxlr_omarchy=1
    depends+=(qt6-websockets)
fi
_dfver=0.5.6
source=("$pkgname-$pkgver.tar.gz::https://github.com/emaspa/openxlr/archive/refs/tags/v$pkgver.tar.gz"
        "DeepFilterNet3_onnx-$_dfver.tar.gz::https://raw.githubusercontent.com/Rikorose/DeepFilterNet/v$_dfver/models/DeepFilterNet3_onnx.tar.gz")
noextract=("DeepFilterNet3_onnx-$_dfver.tar.gz")
sha256sums=('001903fc58c7c62af39d8d8f482a18811b44e2cd50f3a852c4f9ef101ac44589'
            'c94d91f70911001c946e0fabb4aa9adc37045f45a03b56008cb0c8244cb63616')

# DeepFilterNet's noise removal is a Rust library linked into the native
# helper: its model goes where native/Makefile looks, and its crates are
# fetched here so build() runs offline.
prepare() {
  cd "$pkgname-$pkgver"
  install -Dm644 "$srcdir/DeepFilterNet3_onnx-$_dfver.tar.gz" \
    native/deepfilter/model/DeepFilterNet3_onnx.tar.gz
  cd native/deepfilter
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver/src"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  export DEEPFILTER=1 RUSTUP_TOOLCHAIN=stable CARGO_NET_OFFLINE=true
  dotnet publish OpenXLR.Daemon -c Release -r linux-x64 --self-contained false \
    -p:EnableNativeLv2Host=true -o "$srcdir/out/daemon"
  dotnet publish OpenXLR.UI -c Release -r linux-x64 --self-contained false -o "$srcdir/out/ui"
  dotnet publish OpenXLR.Tui -c Release -r linux-x64 --self-contained false -o "$srcdir/out/tui"
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/openxlr"
  cp -r "$srcdir/out/daemon" "$pkgdir/usr/lib/openxlr/daemon"
  cp -r "$srcdir/out/ui" "$pkgdir/usr/lib/openxlr/ui"
  cp -r "$srcdir/out/tui" "$pkgdir/usr/lib/openxlr/tui"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/openxlr-daemon" <<'WRAP'
#!/bin/sh
exec /usr/lib/openxlr/daemon/OpenXLR.Daemon "$@"
WRAP
  cat > "$pkgdir/usr/bin/openxlr" <<'WRAP'
#!/bin/sh
exec /usr/lib/openxlr/ui/OpenXLR.UI "$@"
WRAP
  cat > "$pkgdir/usr/bin/openxlr-tui" <<'WRAP'
#!/bin/sh
exec /usr/lib/openxlr/tui/openxlr-tui "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/openxlr-daemon" "$pkgdir/usr/bin/openxlr" "$pkgdir/usr/bin/openxlr-tui"
  # The Deck plugin and the Omarchy bar reach the daemon through this launcher.
  chmod 755 "$pkgdir/usr/lib/openxlr/daemon/openxlr-control"
  ln -s ../lib/openxlr/daemon/openxlr-control "$pkgdir/usr/bin/openxlr-control"

  # Native messaging for the separately installed browser companion.
  install -Dm644 browser/native-host.json \
    "$pkgdir/etc/chromium/native-messaging-hosts/com.emaspa.openxlr.browser.json"
  install -Dm644 browser/native-host.json \
    "$pkgdir/etc/opt/chrome/native-messaging-hosts/com.emaspa.openxlr.browser.json"

  install -Dm644 packaging/70-openxlr.rules "$pkgdir/usr/lib/udev/rules.d/70-openxlr.rules"
  install -Dm644 packaging/50-xlr-dock-capture-hold.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/50-xlr-dock-capture-hold.conf"
  install -Dm644 packaging/51-openxlr-pro-raw-names.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/51-openxlr-pro-raw-names.conf"
  install -Dm644 packaging/52-openxlr-mk1-capture-hold.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/52-openxlr-mk1-capture-hold.conf"
  install -Dm644 packaging/53-openxlr-wave3-capture-hold.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/53-openxlr-wave3-capture-hold.conf"
  install -Dm644 packaging/55-openxlr-wave3-mk2-playback.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/55-openxlr-wave3-mk2-playback.conf"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/openxlr-focus@emaspa.github.com"
  install -m644 packaging/gnome/openxlr-focus@emaspa.github.com/* \
    "$pkgdir/usr/share/gnome-shell/extensions/openxlr-focus@emaspa.github.com/"

  # The reference unit points into a source checkout; the package runs the wrapper.
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/openxlr-daemon|' packaging/openxlr-daemon.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/openxlr-daemon.service"
  # The submixer's send faders are streams inside pipewire-pulse, which
  # inherits systemd's 1024 open files; raise it for the PulseAudio server.
  install -Dm644 packaging/pipewire-pulse-openxlr.conf \
    "$pkgdir/usr/lib/systemd/user/pipewire-pulse.service.d/openxlr.conf"

  install -Dm644 packaging/openxlr.desktop "$pkgdir/usr/share/applications/openxlr.desktop"
  for size in 16 32 48 64 128 256; do
    install -Dm644 "src/OpenXLR.UI/Assets/icon-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/openxlr.png"
  done
  install -Dm644 src/OpenXLR.UI/Assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/openxlr.svg"

  # OpenDeck loads plugins from the user's config dir; ship it for copying.
  install -dm755 "$pkgdir/usr/share/openxlr"
  cp -r plugin/com.emaspa.openxlr.sdPlugin "$pkgdir/usr/share/openxlr/"
  find "$pkgdir/usr/share/openxlr" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/share/openxlr" -type d -exec chmod 755 {} +

  # A package cannot write into a home directory, so the user runs
  # openxlr-omarchy-enable once to link and enable the plugin.
  if (( _openxlr_omarchy )); then
    install -d "$pkgdir/usr/share/openxlr/omarchy/openxlr.mixer"
    install -m644 packaging/omarchy/openxlr.mixer/{manifest.json,*.qml,*.js} \
      "$pkgdir/usr/share/openxlr/omarchy/openxlr.mixer/"
    install -Dm755 packaging/omarchy/openxlr-omarchy-enable \
      "$pkgdir/usr/bin/openxlr-omarchy-enable"
  fi

  # The notices of the code the native helper carries.
  install -Dm644 native/rnnoise/COPYING "$pkgdir/usr/share/licenses/$pkgname/rnnoise/COPYING"
  install -Dm644 native/deepfilter/libdf/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/deepfilter/LICENSE-MIT"
  install -Dm644 native/deepfilter/libdf/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/deepfilter/LICENSE-APACHE"
  install -Dm644 native/clap/LICENSE "$pkgdir/usr/share/licenses/$pkgname/clap/LICENSE"
  install -Dm644 native/vst3/LICENSE "$pkgdir/usr/share/licenses/$pkgname/vst3/LICENSE"
  install -Dm644 packaging/starter-sounds/CREDITS "$pkgdir/usr/share/licenses/$pkgname/starter-sounds/CREDITS"

  # Record every packaged path for openxlr doctor. Runs last, after the
  # whole payload is in place.
  python3 packaging/install_receipt.py --root "$pkgdir" --prefix /usr \
    --manager arch --version "$pkgver-$pkgrel"
}
