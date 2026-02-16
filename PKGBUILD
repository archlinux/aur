pkgname=weathr
_build_hash=622d5cf47ae454964295cada10380db656d89de3
pkgver=1.3.0
pkgrel=1
pkgdesc="a terminal weather app with ascii animation"
arch=(x86_64)
url="https://github.com/Veirt/weathr"
license=(GPL-3.0-or-later)
depends=(
glibc
libgcc
)
makedepends=(
git
cargo
)

options=('!lto')

source=("git+https://github.com/Veirt/weathr#commit=${_build_hash}")

sha512sums=('8abe8546b3cb5611fe02555df273e647fb687325bf252c22fd81986ceb755c507934783c807b9bbb37edc2a99c7ce8fd6e11d43488484c85a07cd3e0f13491ab')

pkgver() {
  cd weathr
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd weathr
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd weathr
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd weathr
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd weathr
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

