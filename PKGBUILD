# Maintainer: shirushimori <shirushimori@users.noreply.github.com>
pkgname=kawaii-pkg-git
_pkgname=kawaii-pkg
pkgver=r6.435f8dd
pkgrel=1
pkgdesc="Universal Linux package manager wrapper"
arch=('x86_64' 'aarch64')
url="https://github.com/shirushimori/kawaii-pkg"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('kawaii' 'kawaii-pkg')
conflicts=('kawaii' 'kawaii-pkg')
source=("git+https://github.com/shirushimori/kawaii-pkg.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/kawaii" "$pkgdir/usr/bin/kawaii"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
