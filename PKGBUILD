# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=kx-aspe-git
pkgver=r24.492df7e
pkgrel=1
pkgdesc="Keyoxide profile generator CLI using ASPE"
arch=('x86_64')
url="https://codeberg.org/keyoxide/kx-aspe-cli"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
source=("git+https://codeberg.org/keyoxide/kx-aspe-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kx-aspe-cli"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/kx-aspe-cli"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/kx-aspe-cli"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/kx-aspe-cli"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/kx-aspe-cli"
  install -Dm0755 "target/release/kx-aspe" "$pkgdir/usr/bin/kx-aspe"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
