# Maintainer:
# Contributor: Gijs Burghoorn <me@gburghoorn.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="lemurs"
pkgname="$_pkgname-git"
pkgver=0.4.0.r17.g7151336
pkgrel=2
pkgdesc="A customizable TUI display/login manager written in Rust"
url="https://github.com/coastalwhite/lemurs"
license=('Apache-2.0 OR MIT')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'pam'
  'systemd'
)
makedepends=(
  'cargo'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto' 'emptydirs')

backup=('etc/lemurs/config.toml')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  cargo fetch --locked --target host-tuple
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _units=$(($(nproc) > 16 ? $(nproc) : 16))
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=$_units

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgsrc"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"

  mkdir -pm755 "$pkgdir/etc/lemurs/wms"
  mkdir -pm755 "$pkgdir/etc/lemurs/wayland"

  install -Dm644 extra/config.toml -t "$pkgdir/etc/lemurs/"
  install -Dm755 extra/xsetup.sh -t "$pkgdir/etc/lemurs/"

  install -Dm644 extra/lemurs.pam "$pkgdir/etc/pam.d/lemurs"
  install -Dm644 extra/lemurs.service -t "$pkgdir/usr/lib/systemd/system/"

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.Apache-2.0"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
