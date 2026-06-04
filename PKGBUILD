pkgname=vacs-bin
pkgver=2.3.0
pkgrel=2
pkgdesc="VACS voice communication client"
arch=('x86_64')
url="https://vacs.network/"
license=('MIT' 'Apache-2.0')

depends=(
  'alsa-lib'
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'gtk3'
  'hicolor-icon-theme'
  'libpulse'
  'libsoup3'
  'opus'
  'shared-mime-info'
  'wayland'
  'webkit2gtk-4.1'
  'xdg-utils'
)

optdepends=(
  'alsa-plugins: ALSA plugin support'
  'pipewire-audio: PipeWire audio support'
  'pipewire-pulse: PulseAudio compatibility through PipeWire'
)

provides=('vacs')
conflicts=('vacs')

source=(
  "vacs_${pkgver}_amd64.deb::https://github.com/vacs-project/vacs/releases/download/vacs-client-v${pkgver}/vacs_${pkgver}_amd64.deb"
)

sha256sums=(
  '63d817779a754ec89c1256b0735d785237d5d57eee2fd1244d7d50c51864d7cb'
)

package() {
  cd "$srcdir"

  ar x "vacs_${pkgver}_amd64.deb"

  tar -xf data.tar.* -C "$pkgdir"

  # Fix vacs:// URL handler for VATSIM Connect authentication.
  # The upstream desktop file declares the protocol handler but does not pass
  # the callback URL to the application, which KDE rejects.
  local desktop_file="$pkgdir/usr/share/applications/vacs.desktop"

  if [[ ! -f "$desktop_file" ]]; then
    error "Unable to find VACS desktop file: $desktop_file"
    return 1
  fi

  sed -i 's|^Exec=vacs-client$|Exec=vacs-client %u|' "$desktop_file"

  if ! grep -qx 'Exec=vacs-client %u' "$desktop_file"; then
    error "Unable to fix vacs:// handler in $desktop_file"
    return 1
  fi

  # Remove Debian-specific metadata
  rm -rf "$pkgdir/DEBIAN"

  # Install license directory
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  # Attempt to copy license files if present
  find "$pkgdir" \( -iname 'LICENSE*' -o -iname 'COPYING*' \) -type f \
    -exec cp {} "$pkgdir/usr/share/licenses/$pkgname/" \;

  # Ensure desktop database updates work correctly
  install -dm755 "$pkgdir/usr/share/applications"
}
