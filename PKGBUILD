# Maintainer: Victor Ferreira <dev.victorferreira@gmail.com>

pkgname=spider-git
pkgrel=1
pkgver=v0.0.8.r0.gaa642e3
pkgdesc="Install and integrate web apps into the GNOME desktop"
arch=('x86_64')
url="https://github.com/Zaedus/spider"
license=('MIT')

depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'curl')
makedepends=('git' 'meson' 'rust' 'pkgconf' 'python-gobject' 'gobject-introspection' 'python' 'cargo')

provides=("spider")
conflicts=('spider')

source=("$pkgname::git+$url.git#branch=development")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  
  # Fix Python GIRepository issue 
  export PYTHON=/usr/bin/python3
  
  # Configure Rust/Cargo to use system libcurl
  export CARGO_BUILD_TARGET_DIR="$srcdir/target"
  
    # Forçar uso do curl do sistema
    export CURL_SYS_USE_PKG_CONFIG=1
    export RUSTFLAGS="-C link-arg=-lcurl"
  
  # Tell curl-sys to use pkg-config to find curl
  export LIBCURL_NO_PKG_CONFIG=
    export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH"
    export CARGO_FEATURE_STATIC_CURL=0
    export CARGO_FEATURE_CURL_STATIC=0
    export CARGO_FEATURE_CURL_SYS_USE_PKG_CONFIG=1
  
  # Setup meson with wrap mode to download blueprint-compiler
  arch-meson build --buildtype=release --wrap-mode=default
  
  # Compile with ninja
  meson compile -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}
