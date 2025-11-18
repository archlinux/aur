# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
: ${RUSTFLAGS=-C opt-level=2 -C codegen-units=16 -C lto=off}
export CARGO_HOME CARGO_TARGET_DIR RUSTFLAGS RUSTUP_TOOLCHAIN

: ${_use_sodeps:=false}

_pkgname="sysd-manager"
pkgname="$_pkgname-git"
pkgver=2.9.0.r0.g38b4c7d
pkgrel=1
pkgdesc="A systemd GUI to manage service, timer, socket and other units"
url="https://github.com/plrigaux/sysd-manager"
license=("GPL-3.0-or-later")
arch=("x86_64")

depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo build --locked --release --features default

  echo "Generating translation files"
  cargo run -p transtools -- packfiles
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libadwaita-1.so'
      'libgio-2.0.so'
      'libglib-2.0.so'
      'libgobject-2.0.so'
      'libgtk-4.so'
      'libgtksourceview-5.so'
      'libpango-1.0.so'
      'libsystemd.so'
    )"
  fi

  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/sysd-manager" \
    -t "$pkgdir/usr/bin/"

  install -Dm644 "data/icons/hicolor/scalable/apps/io.github.plrigaux.sysd-manager.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  install -Dm644 "data/schemas/io.github.plrigaux.sysd-manager.gschema.xml" \
    -t "$pkgdir/usr/share/glib-2.0/schemas/"

  install -Dm644 "$CARGO_TARGET_DIR/loc/io.github.plrigaux.sysd-manager.desktop" \
    -t "$pkgdir/usr/share/applications/"

  install -Dm644 "$CARGO_TARGET_DIR/loc/io.github.plrigaux.sysd-manager.metainfo.xml" \
    -t "$pkgdir/usr/share/metainfo/"

  cp -r "$CARGO_TARGET_DIR/locale" "$pkgdir/usr/share/"
}
