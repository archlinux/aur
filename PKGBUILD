# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=shortwave-mpris-git
pkgver=5.1.0
pkgrel=1
pkgdesc="Shortwave-MPRIS is an enhanced version of the Shortwave internet radio player adding to the already existing rich feature set. This version provides more complete MPRIS (Media Player Remote Interfacing Specification) support, adds DLNA/UPnP streaming, improved Google Cast support and advanced FFmpeg proxy capabilities for both DNLA & Cast of incompatible streams, ensures maximum compatibility with devices on the local network. Port 8080 is used for the FFmpeg proxy access which should be allowed by most firewalls.

Testing has been limited to devices availble on the author's network.  Devices tested include: Google Home Speaker, Google Chromecast Ultra and Marantz-NR1504 DNLA device. Local play uses Gstreamer and PipeWire Audio. This is a work in progress and may not be compatible with all devices. 

Radio streams found to be working are AAC, MP3, FLAC, m3u8/HLS encoded streams. FFmpeg transcoding is used for all DNLA play and as a fallback for Cast device play for m3u8/HLS streams. Version 5.1.0 includes all features from upstream Shortwave 5.1.0."
arch=('x86_64' 'aarch64')
url="https://github.com/ixnewton/Shortwave-MPRIS"
license=('GPL3')
depends=(
    'gtk4>=4.18.0'
    'libadwaita>=1.8.0'
    'libshumate>=1.7.0'
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
    'lcms2>=2.12.0'
    'libseccomp>=2.5.0'
)
makedepends=('git' 'rust' 'cargo' 'pkgconf' 'meson' 'ninja' 'blueprint-compiler' 'desktop-file-utils' 'appstream-glib')
provides=('shortwave' 'shortwave-mpris')
conflicts=('shortwave' 'shortwave-mpris')
options=('!lto')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "Shortwave"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "Shortwave"
  # Set up Rust toolchain
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Shortwave"
  
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
  cd "Shortwave"
  # Run tests if needed
  # meson test -C build --print-errorlogs
}

package() {
  cd "Shortwave"
  DESTDIR="$pkgdir" meson install -C build
  
  # Install license
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
