# Maintainer: Austin Choi <austin.c.percussion@gmail.com>
pkgname=dusk-lang-git
pkgver=0.3.2.r0.g31fc15b
pkgrel=1
pkgdesc="Compiler for the dusk programming language, a systems language with generational memory safety (development build)"
arch=('x86_64' 'aarch64')
url="https://github.com/choice404/dusk"
license=('MIT OR Apache-2.0')
depends=('clang')
makedepends=('git' 'cargo')
optdepends=('git: package fetching through the dawn tool')
provides=('dusk-lang')
conflicts=('dusk-lang' 'dawn')
source=("dusk::git+https://github.com/choice404/dusk.git")
sha256sums=('SKIP')

pkgver() {
  cd dusk
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dusk
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd dusk
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd dusk
  install -Dm755 target/release/dusk "$pkgdir/usr/bin/dusk"
  install -Dm755 target/release/dawn "$pkgdir/usr/bin/dawn"
  install -dm755 "$pkgdir/usr/share/dusk-lang"
  cp -r lib runtime "$pkgdir/usr/share/dusk-lang/"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 spec.md "$pkgdir/usr/share/doc/$pkgname/spec.md"
}
