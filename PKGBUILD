pkgname=claw-code-git
pkgver=000aed4
pkgrel=1
pkgdesc="CLI tool from ultraworkers/claw-code"
arch=('x86_64')
url="https://github.com/ultraworkers/claw-code"
# Upstream repository does not specify a license
license=('custom')
depends=('gcc-libs' 'oniguruma')
makedepends=('git' 'cargo' 'rust' 'clang' 'lld' 'pkgconf')
conflicts=('claw-code')

source=("git+https://github.com/ultraworkers/claw-code.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/claw-code"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/-/./g' \
    || echo "0.0.0.r$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/claw-code/rust"
  export CC=clang
  export CXX=clang++
  cargo build --release --locked
}

package() {
  cd "$srcdir/claw-code/rust"

  if [[ -f target/release/claw ]]; then
    install -Dm755 target/release/claw "$pkgdir/usr/bin/claw"
  elif [[ -f target/release/claw-cli ]]; then
    install -Dm755 target/release/claw-cli "$pkgdir/usr/bin/claw"
  else
    echo "Binary not found in target/release"
    ls target/release
    exit 1
  fi
}
