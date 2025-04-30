# Maintainer: e-tho <@e-tho:matrix.org>
pkgname=iwmenu-git
pkgver=0.2.0.r0.gfb7cf0c
pkgrel=1
pkgdesc="Launcher-driven Wi-Fi manager for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/e-tho/${pkgname%-git}"
license=('GPL-3.0-or-later')
depends=('iwd' 'dbus')
makedepends=('git' 'cargo')
optdepends=(
  'dmenu: launcher for options navigation via stdin'
  'rofi: launcher for options navigation via stdin'
  'fuzzel: launcher for options navigation via stdin'
  'walker: launcher for options navigation via stdin'
  'nerd-fonts: for font-based icons (default mode)'
)
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