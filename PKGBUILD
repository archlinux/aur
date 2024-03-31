# Maintainer: kojq <kojq@mailfence.com>

pkgname=gitoxide-git
_pkgname=gitoxide
pkgver=0.61.1.r4.g9e9c653a8
pkgrel=1
pkgdesc='An idiomatic, lean, fast & safe pure Rust implementation of Git'
url=https://github.com/Byron/gitoxide
source=(git+https://github.com/Byron/gitoxide)
license=(Apache-2.0 MIT)
arch=(x86_64)
options=(!lto)
makedepends=(cargo cmake git)
conflicts=(gitoxide gitoxide-bin)
provides=(gitoxide)
sha256sums=(SKIP)

prepare() {
  cd $_pkgname
  cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/.*v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  cargo build --frozen --release --no-default-features --features max-pure
}

check() {
  cd $_pkgname
  cargo test --frozen --release --no-default-features --features max-pure
}

package() {
  cd $_pkgname
  install -Dm755 target/release/{gix,ein} -t $pkgdir/usr/bin
  for license in APACHE MIT; do install -Dm644 LICENSE-$license $pkgdir/usr/share/licenses/$_pkgname/LICENSE-$license; done
}
