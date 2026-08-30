# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=openxlr
pkgver=0.1.5
pkgrel=2
pkgdesc="Control suite and PipeWire submixer for Elgato XLR interfaces, with an OpenDeck plugin"
arch=('x86_64')
url="https://github.com/emaspa/openxlr"
license=('GPL-3.0-only')
depends=('aspnet-runtime' 'pipewire' 'pipewire-pulse' 'wireplumber' 'libpulse' 'libusb')
makedepends=('dotnet-sdk')
optdepends=('swh-plugins: software ClipGuard for the XLR Dock'
            'opendeck: Stream Deck control through the bundled plugin')
install=openxlr.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/emaspa/openxlr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b1b45203b813dd0c0d528187adadb9a1a032b1c7c4842dea4e61fb2ce8771fd4')

build() {
  cd "$pkgname-$pkgver/src"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  dotnet publish OpenXLR.Daemon -c Release -r linux-x64 --self-contained false -o "$srcdir/out/daemon"
  dotnet publish OpenXLR.UI -c Release -r linux-x64 --self-contained false -o "$srcdir/out/ui"
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/openxlr"
  cp -r "$srcdir/out/daemon" "$pkgdir/usr/lib/openxlr/daemon"
  cp -r "$srcdir/out/ui" "$pkgdir/usr/lib/openxlr/ui"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/openxlr-daemon" <<'WRAP'
#!/bin/sh
exec /usr/lib/openxlr/daemon/OpenXLR.Daemon "$@"
WRAP
  cat > "$pkgdir/usr/bin/openxlr" <<'WRAP'
#!/bin/sh
exec /usr/lib/openxlr/ui/OpenXLR.UI "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/openxlr-daemon" "$pkgdir/usr/bin/openxlr"

  install -Dm644 packaging/70-openxlr.rules "$pkgdir/usr/lib/udev/rules.d/70-openxlr.rules"
  install -Dm644 packaging/50-xlr-dock-capture-hold.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/50-xlr-dock-capture-hold.conf"

  # The reference unit points into a source checkout; the package runs the wrapper.
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/openxlr-daemon|' packaging/openxlr-daemon.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/openxlr-daemon.service"

  install -Dm644 packaging/openxlr.desktop "$pkgdir/usr/share/applications/openxlr.desktop"
  for size in 16 32 48 64 128 256; do
    install -Dm644 "src/OpenXLR.UI/Assets/icon-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/openxlr.png"
  done
  install -Dm644 src/OpenXLR.UI/Assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/openxlr.svg"

  # OpenDeck loads plugins from the user's config dir; ship it for copying.
  cp -r plugin/com.emaspa.openxlr.sdPlugin "$pkgdir/usr/share/openxlr/"
  find "$pkgdir/usr/share/openxlr" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/share/openxlr" -type d -exec chmod 755 {} +
}
