# Maintainer: e-tho <@e-tho:matrix.org>
pkgname=iwmenu-git
pkgver=0.1.1.r38.ga13d928
pkgrel=1
pkgdesc="Menu-driven Wi-Fi management interface for Linux"
arch=('x86_64')
url="https://github.com/e-tho/${pkgname%-git}"
license=('GPL-3.0-or-later')
depends=('iwd')
makedepends=('git' 'rust' 'cargo')
provides=(${pkgname%-git}=${pkgver})
conflicts=(${pkgname%-git}-bin ${pkgname%-git})
options=('!debug' '!strip')
source=(${pkgname%-git}::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd ${pkgname%-git}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname%-git}

  # Tuning rust compiler
  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n ${_sccache} ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  # Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname%-git}/.cargo    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  # Build the release version using Cargo
  cargo build --release
}

package() {
  cd ${srcdir}/${pkgname%-git}
  # Install binary
  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  # Install license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}