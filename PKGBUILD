# Maintainer: Berk Kapla <berkkapla82@proton.me>

pkgname=kdownload
pkgver=0.1.2
pkgrel=1
pkgdesc="Blazing-fast async segmented file downloader"
arch=('x86_64')
url="https://github.com/compiledkernel-idk/kdownload"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust' 'git')
source=("git+https://github.com/compiledkernel-idk/kdownload.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed/}"
  export LDFLAGS="${LDFLAGS//-flto=auto/}"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-Wl,--no-as-needed -C lto=off"
  env | sort | grep -E '^(AR|CC|CFLAGS|CARGO_|CXX|LD|LDFLAGS|NM|RUSTC|RUSTFLAGS)'
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname"
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed/}"
  export LDFLAGS="${LDFLAGS//-flto=auto/}"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-Wl,--no-as-needed -C lto=off"
  env | sort | grep -E '^(AR|CC|CFLAGS|CARGO_|CXX|LD|LDFLAGS|NM|RUSTC|RUSTFLAGS)'
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/target/release/kdownload" "$pkgdir/usr/bin/kdownload"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
