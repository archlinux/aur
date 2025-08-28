# Maintainer: Mutker Telag <hello@mutker.com>

pkgname=wastearr-git
_pkgname=${pkgname%-git}
pkgver=r0.1.0.r0.g2104b19
pkgrel=1
pkgdesc="CLI tool that analyzes Sonarr and Radarr collections to identify content with poor ratings-to-storage ratios"
arch=('x86_64')
options=('!strip')
license=('MIT')
depends=()
makedepends=('git' 'rust' 'cargo')
url="https://codeberg.org/mutker/$_pkgname"
source=("$_pkgname::git+$url.git")
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm 644 env.sample "$pkgdir/etc/$_pkgname/config"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
