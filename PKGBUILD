# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub-git
pkgver=0.4.51.r3.g21a1c81
pkgrel=1
pkgdesc="An experimental mdbook backend for creating EPUB documents."
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MPL-2.0)
depends=(gcc-libs)
makedepends=(git cargo)
options=(!lto)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(mdbook-epub)
provides=(mdbook-epub="${pkgver%.r*}")

pkgver() {
  cd mdbook-epub
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mdbook-epub
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd mdbook-epub
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd mdbook-epub
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd mdbook-epub
  install -Dm 755 target/release/mdbook-epub "$pkgdir/usr/bin/mdbook-epub"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/mdbook-epub"
}
