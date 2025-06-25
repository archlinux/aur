# Maintainer:
# Contributor: sp1rit <sp1ritCS@protonmail.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="czkawka"
pkgname="$_pkgname-git"
pkgver=9.0.0.r6.g2be42d9
pkgrel=1
pkgdesc="Multi-functional app to find duplicates, similar images, and empty folders"
url="https://github.com/qarmin/czkawka"
license=(
  'CC-BY-4.0'    # icons
  'GPL-3.0-only' # krokiet
  'MIT'          # cli, core, krokiet
)
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
  "czkawka=${pkgver%%.g*}"
  "czkawka-cli=${pkgver%%.g*}"
  "czkawka-gui=${pkgver%%.g*}"
  "krokiet=${pkgver%%.g*}"
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
  sed -E -e 's&#(lto = "thin")&\1\ncodegen-units = 16&' -i "$_pkgsrc/Cargo.toml"

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

  # icon
  install -Dm644 data/icons/com.github.qarmin.czkawka-symbolic.svg "$pkgdir/usr/share/pixmaps/com.github.qarmin.czkawka.svg"

  # launcher
  install -Dm644 data/com.github.qarmin.czkawka.desktop -t "$pkgdir/usr/share/applications/"

  # license
  local licenses=(
    'LICENSE_CC_BY_4_ICONS'::'icons-LICENSE.CC-BY-4.0'
    'czkawka_cli/LICENSE_MIT'::'czkawka_cli-LICENSE.MIT'
    'czkawka_core/LICENSE_MIT'::'czkawka_core-LICENSE.MIT'
    'czkawka_gui/LICENSE_MIT_APP_CODE'::'czkawka_gui-LICENSE'
    'krokiet/LICENSE_GPL_APP'::'krokiet-LICENSE.GPL-3.0-only'
    'krokiet/LICENSE_MIT_CODE'::'krokiet-LICENSE.MIT'
  )
  for i in "${licenses[@]}"; do
    install -Dm644 "${i%%::*}" "$pkgdir/usr/share/licenses/$pkgname/${i##*::}"
  done
}
