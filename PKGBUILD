# Maintainer: director <noreply@devbulle>
pkgname=lafifi-flutter-git
pkgver=0.5.0.r0.gf0884c7
pkgrel=1
pkgdesc="Multi chain, Multi Wallet Crypto Portfolio Tracking App – Flutter Linux edition"
arch=('x86_64')
url="https://git.sr.ht/~drzoidberg/Lafifi"
license=('MIT')
depends=(gtk3 libepoxy xz mpv ffmpeg sqlite libsecret
         gstreamer gst-plugins-base gst-plugins-good gst-libav)
makedepends=('git' 'fvm')

# Build-time secrets — set in your environment or a .env file before building:
#   TELEMETRY_URL, TELEMETRY_SECRET, UPDATE_APP_ID, UPDATE_BASE_URL

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "%s.r%s.g%s" \
         "$(sed -n 's/^version:[[:space:]]*//p' "pubspec.yaml" | cut -d+ -f1)" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  fvm flutter config --enable-linux-desktop || true
  fvm flutter pub get
  fvm flutter build linux --release \
    --dart-define=TELEMETRY_URL="${TELEMETRY_URL:-}" \
    --dart-define=TELEMETRY_SECRET="${TELEMETRY_SECRET:-}" \
    --dart-define=UPDATE_APP_ID="${UPDATE_APP_ID:-}" \
    --dart-define=UPDATE_BASE_URL="${UPDATE_BASE_URL:-}"
}

package() {
  cd "$srcdir/${pkgname}"

  # 1. whole bundle
  install -d "$pkgdir/usr/lib/lafifiv3"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/lafifiv3/"
  chmod -R 755 "$pkgdir/usr/lib/lafifiv3"

  # 2. parent directory for the symlink
  install -d "$pkgdir/usr/bin"

  # 3. symlink (now safe)
  ln -s /usr/lib/lafifi/lafifiv3 "$pkgdir/usr/bin/lafifiv3"

  # 4. desktop & icon
  install -Dm644 "$srcdir/${pkgname}/linux/lafifi.desktop" "$pkgdir/usr/share/applications/lafifi.desktop"
  install -Dm644 "$srcdir/${pkgname}/assets/launcher_icon.png" "$pkgdir/usr/share/pixmaps/lafifi.png"
}
