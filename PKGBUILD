# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname=('anyrun' 'anyrun-provider')
pkgname="$_pkgname"
pkgver=25.12.0
pkgrel=2
pkgdesc="A wayland native, highly customizable runner"
_url=(
  "https://github.com/anyrun-org/anyrun"
  "https://github.com/anyrun-org/anyrun-provider"
)
url="${_url[0]}"
license=('GPL-3.0-only')
arch=("x86_64")

depends=(
  'gtk4-layer-shell'
)
makedepends=(
  'cargo'
)

conflicts=("${_pkgname[1]}")

options=('!lto' '!strip')

_pkgsrc=(
  "${_pkgname[0]}-$pkgver"
  "${_pkgname[1]}-$pkgver"
)
_pkgext="tar.gz"
source=(
  "${_pkgsrc[0]}.$_pkgext"::"${_url[0]}/archive/refs/tags/v$pkgver.$_pkgext"
  "${_pkgsrc[1]}.$_pkgext"::"${_url[1]}/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=(
  '4213a2f65fd6139829128d3c7a7f4b54fec3181f8d549e212021341dd10c3d50'
  'd9b4afcb7bafc4e4d43c64bd6ec8110ae3b858964d68d164c24c0c6505831dd6'
)

prepare() {
  for ((i = ${#_pkgsrc[@]} - 1; i >= 0; i--)); do
    pushd "${_pkgsrc[i]}" > /dev/null
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    popd > /dev/null
  done
}

build() {
  for ((i = ${#_pkgsrc[@]} - 1; i >= 0; i--)); do
    pushd "${_pkgsrc[i]}" > /dev/null
    cargo build --frozen --release --all-features
    popd > /dev/null
  done
}

package() {
  for ((i = ${#_pkgsrc[@]} - 1; i >= 0; i--)); do
    install -Dm755 "${_pkgsrc[i]}/$CARGO_TARGET_DIR/release/${_pkgname[i]}" -t "$pkgdir/usr/bin/"
  done

  cd "${_pkgsrc[0]}"
  for i in "$CARGO_TARGET_DIR/release"/*.so; do
    install -Dm644 "$i" -t "$pkgdir/usr/lib/anyrun/"
  done

  install -Dm644 examples/config.ron -t "$pkgdir/etc/xdg/anyrun/"
  install -Dm644 anyrun/res/style.css -t "$pkgdir/etc/xdg/anyrun/"
}
