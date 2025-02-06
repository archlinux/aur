# Maintainer: Michael Adler <therisen06@gmail.com>

_pkgname=extension-downloader
pkgname=${_pkgname}-git
pkgver=v0.1.0.r70.gb67797d
pkgrel=1
pkgdesc='Download browser extensions for Firefox and Chromium-based browsers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/michaeladler/extension-downloader'
license=('Apache')
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # example config file
  install -Dm644 example/config.toml "$pkgdir/usr/share/extension-downloader/config.toml"
}
