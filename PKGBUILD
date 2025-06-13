# Maintainer: Hunter Davenport <mallow.boxes6w@icloud.com>
_pkgname=boxunbox
pkgname="${_pkgname}-git"
pkgver=0.1.25.r0.g086a229
pkgrel=1
pkgdesc='A Rust-based alternative to GNU stow'
url="https://github.com/dablenparty/$_pkgname"
license=('0BSD')
makedepends=('cargo' 'git')
depends=()
arch=('x86_64')
source=("${pkgname}::git+${url}.git")
provides=(unbox)
sha256sums=('SKIP')
conflicts=('boxunbox')

pkgver() {
  cd "$srcdir/$pkgname" || exit 1

  # Git, tags available
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$pkgname" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname" || exit 1

  # TODO: once filesystem tests are in-place, make sure this
  # doesn't break builds because fs testing can be finnicky.
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --workspace --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname" || exit 1

  # TODO: generate completion files
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/unbox"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
