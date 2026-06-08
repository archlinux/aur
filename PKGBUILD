# Maintainer: lightjunction <<redacted-email>>
pkgname=new-api-privacy-filter-git
_pkgname=${pkgname%-git}
pkgver=0.2.1.r0.ga580860
pkgrel=1
pkgdesc='Rust privacy redaction proxy for OpenAI-compatible New API deployments'
arch=('x86_64')
url='https://github.com/LIghtJUNction/new-api-privacy-filter'
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('cargo' 'git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS/-fuse-ld=lld/}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS/-fuse-ld=lld/}"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS/-fuse-ld=lld/}"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
