# Maintainer: Amirul Fitri <tounghacker@gmail.com>

# maintainer's variables
_commit=185bfb0a75d3af75d915c84fa1bcd514653220f1

pkgname=playit
pkgver=v1.0.0+rc2+1+g185bfb0
pkgrel=1
pkgdesc="A tunneling tool to host a game server without port forwarding or sharing public IP"
arch=('x86_64')
url="https://playit.gg"
depends=('glibc' 'gcc-libs')
license=('BSD')
makedepends=('git' 'cargo')
source=("${pkgname}::git+https://github.com/playit-cloud/playit-agent.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  #cargo update # FIXME: remove later when upstream update Cargo.lock
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  #cargo test --frozen --all-features # FIXME: build failed, when enable check! :(
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/playit-cli "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
