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
license=(
  MIT
  LicenseRef-freeware
)
depends=(
  alsa-lib
  gcc-libs
  glibc
  libglvnd
)
makedepends=(
  cargo
  cmake
  git
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$_pkgname::git+$url.git"
  "vanilla-extractor::git+https://github.com/doukutsu-rs/vanilla-extractor.git#tag=v1.0.2"
  "https://www.cavestory.org/downloads/cavestoryen.zip"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'aa87fa30bee9b4980640c7e104791354e0f1f6411ee0d45a70af70046aa0685f'
)

pkgver() {
  git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/vanilla-extractor"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$srcdir/$_pkgname"
  cargo build --release --frozen --bin $_pkgname

  cd "$srcdir/vanilla-extractor"
  cargo build --release --frozen --bin vanilla-extractor

  cd "$srcdir/CaveStory"
  "$srcdir/vanilla-extractor/target/release/vanilla-extractor"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname"

  install -dm755 "$pkgdir/usr/bin"
  cat <<'EOF' >"$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
set -e

USER_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/doukutsu-rs/data"
SYS_DATA_DIR="/usr/share/doukutsu-rs/data"

mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/doukutsu-rs"

if [ -z "$CAVESTORY_DATA_DIR" ]; then
  if [ -n "$(find "$USER_DATA_DIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
    export CAVESTORY_DATA_DIR="$USER_DATA_DIR"
  elif [ -d "$SYS_DATA_DIR" ]; then
    export CAVESTORY_DATA_DIR="$SYS_DATA_DIR"
  fi
fi

exec /usr/lib/doukutsu-rs/doukutsu-rs "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -r "$srcdir/CaveStory/data" "$pkgdir/usr/share/$_pkgname/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/share/$_pkgname/data"

  cd "$srcdir/$_pkgname"

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

  install -Dm644 "$srcdir/CaveStory/Readme.txt" "$pkgdir/usr/share/licenses/$pkgname/CaveStory-Readme.txt"
  install -Dm644 "$srcdir/CaveStory/Manual.html" "$pkgdir/usr/share/doc/$pkgname/Manual.html"
  cp -r "$srcdir/CaveStory/Manual" "$pkgdir/usr/share/doc/$pkgname/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/share/doc/$pkgname/Manual"
}
