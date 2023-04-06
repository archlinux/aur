# Maintainer: Edvin Bryntesson <aur@edvinbryntesson.se>
_pkgname="anyrun"
pkgname="${_pkgname}-git"
pkgver=r29.c74235a
pkgrel=4
pkgdesc="A rust-based wayland native krunner-like runner, made with customizability in mind."
arch=("x86_64")
url="github.com/Kirottu/anyrun"
license=('GPL3')
depends=(gtk-layer-shell gtk3 pango cairo gdk-pixbuf2 glib2)
makedepends=(git cargo)
source=("${_pkgname}::git+https://$url.git")
sha256sums=('SKIP')
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release 
}

package() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  mkdir -p "$pkgdir/etc/anyrun/plugins"
  printf "Config( \n  width: 800, \n  position: Top, \n  plugins: [ \n    'libapplications.so', \n    'libsymbols.so', \n    'libshell.so', \n    'libtranslate.so', \n  ], \n)" > "$pkgdir/etc/anyrun/config.ron" 
  cp target/release/*.so "$pkgdir/etc/anyrun/plugins/"
}
