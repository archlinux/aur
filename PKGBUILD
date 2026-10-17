# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=doukutsu-rs
pkgname=$_pkgname-git
pkgver=1.0.0.r50.d05995b
pkgrel=1
pkgdesc="A faithful and open-source remake of Cave Story's engine written in Rust"
arch=(
  x86_64
  aarch64
)
url=https://github.com/doukutsu-rs/doukutsu-rs
license=(MIT)
depends=(
  alsa-lib
  gcc-libs
  glibc
  hicolor-icon-theme
  libglvnd
)
makedepends=(
  cargo
  cmake
  git
  pkgconf
)
optdepends=(
  'doukutsu: freeware Cave Story game assets'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g'
}

prepare() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --bin $_pkgname
}

package() {
  cd $_pkgname

  install -Dm755 target/release/$_pkgname -t "$pkgdir"/usr/bin

  install -Dm644 res/flatpak/io.github.doukutsu_rs.doukutsu-rs.desktop \
    "$pkgdir"/usr/share/applications/io.github.doukutsu_rs.doukutsu-rs.desktop
  install -Dm644 res/flatpak/io.github.doukutsu_rs.doukutsu-rs.metainfo.xml \
    "$pkgdir"/usr/share/metainfo/io.github.doukutsu_rs.doukutsu-rs.metainfo.xml

  install -Dm644 res/macos/16x16.png \
    "$pkgdir"/usr/share/icons/hicolor/16x16/apps/io.github.doukutsu_rs.doukutsu-rs.png
  install -Dm644 res/macos/32x32.png \
    "$pkgdir"/usr/share/icons/hicolor/32x32/apps/io.github.doukutsu_rs.doukutsu-rs.png
  install -Dm644 res/macos/128x128.png \
    "$pkgdir"/usr/share/icons/hicolor/128x128/apps/io.github.doukutsu_rs.doukutsu-rs.png
  install -Dm644 res/macos/256x256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/io.github.doukutsu_rs.doukutsu-rs.png
  install -Dm644 res/macos/512x512.png \
    "$pkgdir"/usr/share/icons/hicolor/512x512/apps/io.github.doukutsu_rs.doukutsu-rs.png
  install -Dm644 res/macos/crabsue.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/io.github.doukutsu_rs.doukutsu-rs.svg

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
