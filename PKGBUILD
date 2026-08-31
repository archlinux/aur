# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.43.0
pkgrel=1
pkgdesc="System-wide speech-to-text for Linux desktops"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
makedepends=()
depends=(
  'python'
  'python-sounddevice'
  'python-numpy'
  'python-soxr'
  'python-evdev'
  'python-pyperclip'
  'python-pyudev'
  'python-rich'
  'python-pulsectl'
  'wtype'
  'ydotool'
  'wl-clipboard'
  'xclip'
  'xdotool'
  'xorg-xprop'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse'
)
optdepends=(
  'python-dbus: suspend/resume monitoring'
  'python-gobject: suspend monitoring, AT-SPI detection, and Mic-OSD support'
  'gtk4-layer-shell: themed Mic-OSD visualization'
  'cmake: accelerated pywhispercpp source builds'
  'git: accelerated pywhispercpp source builds'
  'base-devel: accelerated pywhispercpp source builds'
)

install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodroot/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('214c91f4b7e2b99bc44c764df5bc9a7a0719197250eb4a6a576d0be15115bd23')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # nothing to build; user runs 'hyprwhspr setup' post-install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Payload into /usr/lib keeps repo layout intact
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r lib bin config share README.md LICENSE requirements*.txt "$pkgdir/usr/lib/$pkgname"
  python scripts/validate-package-payload.py "$pkgdir/usr/lib/$pkgname"
  # Note: scripts directory removed - functionality moved to CLI commands

  # Make sure main launcher is executable
  if [ -f "$pkgdir/usr/lib/$pkgname/bin/hyprwhspr" ]; then
    chmod 755 "$pkgdir/usr/lib/$pkgname/bin/hyprwhspr"
  fi

  # Install systemd user service
  install -Dm644 "config/systemd/hyprwhspr.service" \
    "$pkgdir/usr/lib/systemd/user/hyprwhspr.service"

  # Create wrapper that uses the repo's bin/hyprwhspr with fixed paths
  install -d "$pkgdir/usr/bin"
  sed 's|PACKAGE_ROOT="$(dirname "$SCRIPT_DIR")"|PACKAGE_ROOT="/usr/lib/hyprwhspr"|' \
    "$srcdir/$pkgname-$pkgver/bin/$pkgname" > "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Docs & license
  install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
