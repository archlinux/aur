# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: seth <getchoo at tuta dot io>

pkgname=joshuto
pkgver=0.9.9
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
arch=('x86_64')
url="https://github.com/kamiyaa/joshuto"
license=('LGPL-3.0-only')
makedepends=('cargo' 'libgit2')
optdepends=(
        'fzf: for better file searching'
        'xclip: for clipboard support on X11'
        'xsel: for clipboard support on X11'
        'wl-clipboard: for clipboard support on Wayland'
        'zoxide: for use in cd functions'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kamiyaa/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85a230183f7478dee7c29229d78313ee07b759e596e19292acf024d2e5735efa')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # fix lto
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"

  cargo build --frozen --release --all-features 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
