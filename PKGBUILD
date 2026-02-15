# Maintainer: CxOrg <clx.org@cloud-org.uk>
# Contributor: Felix Häcker <haeckerfelix@gnome.org>
pkgname=shortwave-mpris-git
pkgver=5.1.0.r7.g1cf5f85
pkgrel=1
pkgdesc="Internet radio player with extended MPRIS support, device support for DLNA/UPnP & Google Cast + FFmpeg proxy for incompatible streams"
arch=('x86_64' 'aarch64')
url="https://github.com/ixnewton/Shortwave-MPRIS"
license=('GPL3')
depends=(
    'gtk4>=4.18.0'
    'libadwaita>=1.8.0'
    'libshumate>=1.3.0'
    'gstreamer>=1.24.0'
    'gst-plugins-base-libs>=1.24.0'
    'gst-plugins-bad>=1.24.0'
    'gst-plugins-good'
    'gst-libav'
    'ffmpeg>=4.0.0'
    'sqlite>=3.20.0'
    'openssl>=1.0.0'
    'dbus'
    'glib2>=2.80.0'
    'glycin-gtk4>=2.0.0'
    'lcms2>=2.12.0'
    'libseccomp>=2.5.0'
)
makedepends=('git' 'rust>=1:1.82.0' 'cargo' 'pkgconf' 'meson' 'ninja' 'blueprint-compiler' 'desktop-file-utils' 'appstream-glib' 'glib2')
provides=('shortwave' 'shortwave-mpris')
conflicts=('shortwave' 'shortwave-mpris')
options=('!lto')
install=shortwave-mpris-git.install
source=("git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "Shortwave-MPRIS"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "Shortwave-MPRIS"
  # Set up Rust toolchain
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Shortwave-MPRIS"
  
  # Set up Rust environment
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  
  # Build with release profile
  arch-meson . build \
    --buildtype=release \
    -Dprofile=default
  
  ninja -C build
}

check() {
  cd "Shortwave-MPRIS"
  # Run tests if needed
  # meson test -C build --print-errorlogs
}

package() {
  cd "Shortwave-MPRIS"
  DESTDIR="$pkgdir" meson install -C build
  
  # Force compilation of GSettings schemas to ensure they're properly compiled
  echo "==> Force-compiling GSettings schemas in package..."
  if [ -d "$pkgdir/usr/share/glib-2.0/schemas" ]; then
    glib-compile-schemas "$pkgdir/usr/share/glib-2.0/schemas/"
    echo "==> Schema compilation completed successfully"
    
    # Verify our key is in the compiled schema
    if glib-compile-schemas --dry-run "$pkgdir/usr/share/glib-2.0/schemas/" 2>&1 | grep -q "playback-volume-local"; then
      echo "==> Schema validation passed: playback-volume-local key found"
    else
      echo "==> WARNING: Schema validation failed"
    fi
  fi
  
  # Install license
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
