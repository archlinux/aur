# Maintainer: drzoidberg <drzoidberg+aur@cloudblock.dev>
pkgname=polify-git
pkgver=0.1.5
pkgrel=1
pkgdesc="Cross-platform music manager with multi-source library, audio fingerprinting, and ID3 tag editing"
arch=('x86_64')
url="https://buildhut.fly.dev/apps/polify"
license=('MIT')
depends=('gtk3' 'libepoxy' 'xz' 'mpv' 'ffmpeg' 'sqlite' 'libsecret'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
makedepends=('git' 'flutter' 'make')
provides=('polify')
conflicts=('polify')
source=("polify::git+https://git.sr.ht/~drzoidberg/Polify")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/polify"
  local _tag
  if _tag="$(git describe --long --tags 2>/dev/null)"; then
    printf '%s' "$_tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "%s.r%s.%s" \
           "$(sed -n 's/^version:[[:space:]]*//p' pubspec.yaml | cut -d+ -f1)" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/polify"
  make version-info
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/polify"

  # Application bundle
  install -d "$pkgdir/usr/lib/polify"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/polify/"
  chmod -R 755 "$pkgdir/usr/lib/polify"

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/polify/polify "$pkgdir/usr/bin/polify"

  # Desktop entry and icon
  install -Dm644 linux/polify.desktop "$pkgdir/usr/share/applications/polify.desktop"
  install -Dm644 assets/launcher_icon.png "$pkgdir/usr/share/pixmaps/polify.png"
}
