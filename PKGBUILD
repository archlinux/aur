# Maintainer: Sebastian Arrieta <sarrietav.dev@gmail.com>
pkgname=omaread-git
pkgver=r18.5a3d237
pkgrel=1
pkgdesc="A fast, keyboard-first EPUB reader for Omarchy"
arch=('x86_64')
url="https://github.com/sarrietav-dev/omaread"
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=('speech-dispatcher: read aloud'
            'hyphen-en: English hyphenation'
            'hyphen-es: Spanish hyphenation')
provides=('omaread')
conflicts=('omaread')
# makepkg's LTO builds the bundled C (SQLite, ring) as GCC bitcode rust-lld can't link
options=('!lto')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/omaread "$pkgdir/usr/bin/omaread"
  install -Dm644 "data/io.github.sarrietav_dev.Omaread.desktop" \
    "$pkgdir/usr/share/applications/io.github.sarrietav_dev.Omaread.desktop"
  install -Dm644 "data/io.github.sarrietav_dev.Omaread.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.sarrietav_dev.Omaread.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
