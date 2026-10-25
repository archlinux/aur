# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=openxlr
pkgver=0.2.4
pkgrel=1
pkgdesc="A Wave Link replacement for Linux: a PipeWire mixer with effects and an OpenDeck plugin for any microphone, plus full control of Elgato XLR interfaces and Wave microphones"
arch=('x86_64')
url="https://github.com/emaspa/openxlr"
license=('GPL-3.0-only')
depends=('aspnet-runtime' 'pipewire' 'pipewire-pulse' 'wireplumber' 'libpulse' 'libusb' 'lilv'
         'fontconfig' 'libx11' 'libice' 'libsm' 'glib2')
makedepends=('dotnet-sdk' 'dotnet-targeting-pack' 'lv2' 'pkgconf' 'python')
optdepends=('swh-plugins: software ClipGuard for the XLR Dock'
            'lsp-plugins-lv2: a starter set of LV2 plugins for the inserts'
            'opendeck: Stream Deck control through the bundled plugin'
            'gdk-pixbuf2: SVG application icons in the UI'
            'librsvg: SVG application icons in the UI')
install=openxlr.install
backup=('etc/chromium/native-messaging-hosts/com.emaspa.openxlr.browser.json'
        'etc/opt/chrome/native-messaging-hosts/com.emaspa.openxlr.browser.json')
# The receipt below hashes the payload; makepkg must not strip it afterwards.
options=('!strip')

# Omarchy 4 replaced Waybar with its own Quickshell process, whose bar is
# built from plugins. Ship the mixer's bar plugin only when the build host
# has that shell, so a package built on plain Arch is unchanged.
_openxlr_omarchy=0
if [[ -f /usr/share/omarchy/shell/Ui/PluginBarApi.qml ]]; then
    _openxlr_omarchy=1
    depends+=(qt6-websockets)
fi
source=("$pkgname-$pkgver.tar.gz::https://github.com/emaspa/openxlr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa8ab99d626452092e75a6203f8aee8d357c46a8e1a4976983172f612c7e3ed2')

build() {
  cd "$pkgname-$pkgver/src"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
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

  # Record every packaged path for openxlr doctor. Runs last, after the
  # whole payload is in place.
  python3 packaging/install_receipt.py --root "$pkgdir" --prefix /usr \
    --manager arch --version "$pkgver-$pkgrel"
}
