# Maintainer:
# Contributor: sp1rit <sp1ritCS@protonmail.com>

_pkgname=czkawka
pkgname="$_pkgname-git"
pkgver=7.0.0.r4.g2a32a52
pkgrel=1
pkgdesc="Multi-functional app to find duplicates, similar images, and empty folders."
url="https://github.com/qarmin/czkawka"
license=('MIT')
arch=('x86_64')

depends=(
  "gtk4"
)
makedepends=(
  "git"
  "rust"
  "cargo"
)

provides=(
  "czkawka=${pkgver%%.r*}"
  "czkawka-cli=${pkgver%%.r*}"
  "czkawka-gui=${pkgver%%.r*}"
)
conflicts=(
  "czkawka"
  "czkawka-cli"
  "czkawka-gui"
)

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=("SKIP")

prepare() {
  export CARGO_HOME="${CARGO_HOME:-$SRCDEST/cargo-home}"
  export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
  export CARGO_TARGET_DIR=target

  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  cargo build --release --bin czkawka_gui
  cargo build --release --bin czkawka_cli
}

check() {
  cd "$_pkgsrc/czkawka_core"
  cargo test
}

package() {
  cd "$_pkgsrc"

  # binaries
  install -Dm755 target/release/czkawka_gui -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/czkawka_cli -t "$pkgdir/usr/bin/"

  # symlink
  ln -sf "czkawka_gui" "$pkgdir/usr/bin/czkawka"

  # launcher
  install -Dm644 data/com.github.qarmin.czkawka.desktop -t "$pkgdir/usr/share/applications/"

  # license
  for i in czkawka_cli czkawka_core czkawka_gui ; do
    install -Dm644 "$i/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.$i"
  done
}
