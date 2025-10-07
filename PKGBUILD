# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=reel
_app_id=dev.arsfeld.Reel
pkgver=0.7.5
pkgrel=1
pkgdesc="A modern GTK frontend for Plex and other media servers"
arch=('x86_64')
url="https://github.com/arsfeld/reel"
license=('GPL-3.0-or-later')
depends=(
  'gst-libav'
  'gst-plugin-gtk4'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gstreamer-vaapi'
  'gtk4'
  'libadwaita'
  'libsecret'
  'mpv'
  'openssl'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'clang'
  'git'
  'mold'
)
options=('!lto')  # sqlx crate fails with LTO enabled
source=("git+https://github.com/arsfeld/reel.git#tag=v$pkgver")
sha256sums=('a94f530e504d022ded260c8e54972bd9ce7465e00d27dcf186771243f6a5fa71')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="com.github.$pkgname" \
    "data/${_app_id}.desktop"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Use mold linker for significantly faster link times
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen

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
