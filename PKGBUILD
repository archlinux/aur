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

  # Match the engine's local build flags and satisfy strikes' BMI2 requirement.
  # AUR builds from source on the user's machine; `native` is intentional.
  export RUSTFLAGS="${RUSTFLAGS} -C target-cpu=native -C target-feature=+avx2,+bmi2,-avx512f,-avx512vl,-avx512bw"

  cargo build --release --locked --bins
}

check() {
  cd "$srcdir/oopsmate"

  export RUSTFLAGS="${RUSTFLAGS} -C target-cpu=native -C target-feature=+avx2,+bmi2,-avx512f,-avx512vl,-avx512bw"

  cargo test --release --locked
}

package() {
  cd "$srcdir/oopsmate"

  install -Dm755 target/release/oops_mate "$pkgdir/usr/bin/oops_mate"
  install -Dm755 target/release/oopsmate-nnue "$pkgdir/usr/bin/oopsmate-nnue"
  install -Dm755 target/release/oopsmate-pesto "$pkgdir/usr/bin/oopsmate-pesto"
}
