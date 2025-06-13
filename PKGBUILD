# Maintainer: Hunter Davenport <mallow.boxes6w@icloud.com>

pkgname=boxunbox
pkgver=0.1.26
pkgrel=1
pkgdesc='A Rust-based alternative to GNU stow'
url='https://github.com/dablenparty/boxunbox'
license=('0BSD')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
provides=(unbox)
sha256sums=('8732f168387d47b54975859bbafbb066393526f8c6f717fd3451f32ab0b122cc')
conflicts=('boxunbox-git')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  # TODO: once filesystem tests are in-place, make sure this
  # doesn't break builds because fs testing can be finnicky.
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --workspace --frozen --all-features
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  # TODO: generate completion files
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/unbox"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
