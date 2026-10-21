# Maintainer: satodu <sato.du@gmail.com>
pkgname=kappa-file-manager
pkgver=0.1.5
pkgrel=1
pkgdesc='Brutalist file manager for Ryoku OS (Rust core, Quickshell UI); independent community project'
arch=('x86_64' 'aarch64')
url='https://github.com/satodu/kappa-file-manager'
license=('0BSD')
depends=('quickshell' 'ryoku-desktop' 'xdg-utils' 'udisks2' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('kdeconnect: phone pairing, ping, ring and sharing'
            'kio-fuse: browse phone folders as local files'
            'rclone: browse Google Drive and OneDrive remotes (mount)'
            'matugen: Kappa-only color schemes (Appearance)'
            'swww: set an image as wallpaper from the details panel'
            'ghostty: default terminal for "Open terminal here" (any terminal in $TERMINAL also works)')
_tag="v${pkgver//_/-}"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('5eeb547a65fe675e4cf553bb939a58ee5f8f2a082484e9ee7761ced72acda353')

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-${pkgver//_/-}"

  # Rust backend (not on PATH: the launcher points the interface at it)
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"

  # QML interface
  install -d "$pkgdir/usr/share/$pkgname/qml"
  cp -r qml/. "$pkgdir/usr/share/$pkgname/qml/"
  find "$pkgdir/usr/share/$pkgname/qml" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname/qml" -type f -exec chmod 644 {} +

  # Launcher, desktop entry, icon and license
  install -Dm755 "packaging/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "packaging/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "packaging/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
