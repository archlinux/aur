# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=reel
_app_id=dev.arsfeld.Reel
pkgver=0.7.8
pkgrel=1
pkgdesc="A modern GTK frontend for Plex and other media servers"
arch=('x86_64' 'aarch64')
url="https://github.com/arsfeld/reel"
license=('GPL-3.0-or-later')
depends=(
  'gst-libav'
  'gst-plugin-gtk4'
  'gst-plugin-va'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'libsecret'
  'mpv'
  'openssl'
  'sqlite'
  'zstd'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'clang'
  'git'
  'mold'
)
source=("git+https://github.com/arsfeld/reel.git#tag=v$pkgver")
sha256sums=('0fe08da7f2df104de883f41aa9aef522087a906f3ba24ecfa6df10e795fbaeca')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="com.github.$pkgname" \
    "data/${_app_id}.desktop"
}

build() {
  cd "$pkgname"
  export GETTEXT_SYSTEM=true
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Use mold linker for significantly faster link times
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "data/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
