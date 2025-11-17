# Maintainer: Alexander Tarasov <a.tevg@ya.ru>
pkgsubn=rpmi
pkgname=rpmi
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple graphical utility that installs/upgrades/removes .rpm files built with Rust and EGUI."
arch=('any')
url="https://github.com/arabianq/rpmi"
license=('MIT')
makedepends=(clang rust cargo)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd "${srcdir}/rpmi-${pkgver}"
  
  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo"    # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/rpmi-${pkgver}"

  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}


package() {
  cd "${srcdir}/rpmi-${pkgver}"
  install -Dm755 "target/release/rpmi" "${pkgdir}/usr/bin/rpmi"
  install -Dm644 "rpmi.desktop" "${pkgdir}/usr/share/applications/rpmi.desktop"

}