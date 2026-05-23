# Maintainer: PS-Wizard (packaged for AUR)

pkgname=oopsmate-git
pkgver=r185.32179b9
pkgrel=1
pkgdesc='UCI chess engine in Rust (git)'
arch=('x86_64')
url='https://github.com/PS-Wizard/oopsmate'
license=('GPL-3.0-only')
makedepends=('git' 'rust')
provides=('oopsmate')
conflicts=('oopsmate')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/oopsmate"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/oopsmate"

  # strikes requires BMI2 (PEXT) for slider lookups.
  export RUSTFLAGS="${RUSTFLAGS} -C target-feature=+bmi2"

  cargo build --release --locked --bins
}

check() {
  cd "$srcdir/oopsmate"

  export RUSTFLAGS="${RUSTFLAGS} -C target-feature=+bmi2"

  cargo test --release --locked
}

package() {
  cd "$srcdir/oopsmate"

  install -Dm755 target/release/oops_mate "$pkgdir/usr/bin/oops_mate"
  install -Dm755 target/release/oopsmate-nnue "$pkgdir/usr/bin/oopsmate-nnue"
  install -Dm755 target/release/oopsmate-pesto "$pkgdir/usr/bin/oopsmate-pesto"
}
