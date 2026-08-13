# Maintainer: grootar nigredo1999@gmail.com

_pkgname=twitchdrops_miner
pkgname="twitch_drops_miner"
pkgver=dev.build.r0.g602a0cc
pkgrel=1
pkgdesc="A multi-account Rust TUI tool for automatic Twitch Drops farming"
arch=('x86_64' 'aarch64')
url="https://github.com/this-is-really/TwitchDropSentryMulti"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  
  (set -o pipefail; git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g') ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTFLAGS="$RUSTFLAGS -C target-cpu=native" 

  export CFLAGS="${CFLAGS//-flto*/}"
  export CXXFLAGS="${CXXFLAGS//-flto*/}"

  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
