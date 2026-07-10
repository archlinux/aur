# Maintainer: Katie Varkony (tristanandlucky@gmail.com)

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=1.88.0}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN
export RUSTC_BOOTSTRAP=1

: ${_commit=}

_pkgname="nbtworkbench"
pkgname="$_pkgname-git"
pkgver=1.6.2.r40.g9372bde
pkgrel=1
pkgdesc="A modern editor for Minecraft's NBT data format"
url='https://github.com/RealRTTV/nbtworkbench'
license=('MPL-2.0')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'libgcc'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'lld'
  'rustup'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # warn instead of error
  sed -E -e 's&\b(deny|forbid)\(&warn(&' -i src/main.rs

  # continue
  cargo update
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local _units=$(($(nproc) > 16 ? $(nproc) : 16))
  local _rustflags=(
    -C codegen-units=$_units
    -C linker=clang -C link-arg=-fuse-ld=lld
    -C lto=off
    -C opt-level=2
  )
  export RUSTFLAGS="${_rustflags[*]}"

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgsrc"
  RUST_BACKTRACE=1 cargo test --frozen --all-features
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/nbtworkbench" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 icons/nbtworkbench.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=NBT Workbench
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
StartupWMClass=$_pkgname
Terminal=false
Categories=Utility;
END
}
