# Maintainer:
# Contributor: sp1rit <sp1ritCS@protonmail.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${RUSTUP_TOOLCHAIN:=stable}
: ${CARGO_TARGET_DIR:=target}

export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname=czkawka
pkgname="$_pkgname-git"
pkgver=7.0.0.r4.g2a32a52
pkgrel=2
pkgdesc="Multi-functional app to find duplicates, similar images, and empty folders"
url="https://github.com/qarmin/czkawka"
license=('MIT')
arch=('x86_64')

depends=(
  'gtk4'
  'libheif'
)
makedepends=(
  'git'
  'cargo'
)

provides=(
  "czkawka=${pkgver%%.r*}"
  "czkawka-cli=${pkgver%%.r*}"
  "czkawka-gui=${pkgver%%.r*}"
  "krokiet=${pkgver%%.r*}"
)
conflicts=(
  "czkawka"
  "czkawka-cli"
  "czkawka-gui"
  "krokiet"
)

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=("SKIP")

prepare() {
  cd "$_pkgsrc"
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cargo_options=(
    --bin czkawka_cli
    --bin czkawka_gui
    --bin krokiet
    --features heif
    --release
  )

  cd "$_pkgsrc"
  cargo build "${_cargo_options[@]}"
}

check() {
  cd "$_pkgsrc/czkawka_core"
  cargo test
}

package() {
  cd "$_pkgsrc"

  # binaries
  install -Dm755 "$CARGO_TARGET_DIR"/release/czkawka_gui -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR"/release/czkawka_cli -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR"/release/krokiet -t "$pkgdir/usr/bin/"

  # symlink
  ln -sf "czkawka_gui" "$pkgdir/usr/bin/czkawka"

  # launcher
  install -Dm644 data/com.github.qarmin.czkawka.desktop -t "$pkgdir/usr/share/applications/"

  # license
  for i in czkawka_cli czkawka_core czkawka_gui krokiet; do
    install -Dm644 "$i/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.$i"
  done
}
